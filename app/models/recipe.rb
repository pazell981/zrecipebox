class Recipe < ActiveRecord::Base

  require 'pg'

	# after_save :notify_recipe_addition

	belongs_to :users

	has_many :categories, through: :recipe_categories
	has_many :users, through: :recipe_boxes
	has_many :users, through: :favorites
	has_many :recipe_boxes
	has_many :recipe_categories
	has_many :recipes
	has_many :favorites
	has_many :comments

	scope :title, -> (recipeTitle) { where("title LIKE ?", "%#{recipeTitle}%") }
	scope :category, -> (recipeCategory) { where(:category_id => recipeCategory) }
	scope :favorite, -> (favorite, current_user) { where("favorite = ? AND user_id = ?", favorite, current_user) }

	attr_accessor :image, :category, :favorite

	validates :title,    		:presence   => true,
	          :format               		=> { :with => /\A([A-Za-z\W\s]*)\z/i}
	
	validates :description, :format     => { :with => /\A([A-Za-z\W\s]*)\z/i}
	
	has_attached_file :image, :styles 	=> { :medium => "300x300>", :thumb => "100x100>" }, 
														:default_url => "/imagesç/:style/missing.jpg"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  validates :yield,   		:format     => { :with => /\A([\dA-Za-z\s]*)\z/i }
  
  validates :actual_time, :allow_blank => true,
  					:format			=> { :with => /\d*[:]\d\d/, :message => "Please enter times in HH:MM format. "}

  validates :total_time, 	:allow_blank => true,
  					:format			=> { :with => /\d*[:]\d\d/, :message => "Please enter times in HH:MM format. "}

  validates :source, 			:format			=> { :with => /\A([\dA-Za-z\s]*)\z/i }

  validates :instructions,:presence		=> true

  # def notify_recipe_addition
  #    connection.execute "NOTIFY #{:channel}"
  # end

  # cnf = YAML::load_file(File.join(__dir__, '/config/database.yml'))

  # if Rails.env.development?
  #   conn = PG.connect( :dbname => 'recipebox_development', :user => cnf[:development][:user], :password => cnf[:development][:password] )
  # elsif Rails.env.test?
  #   conn = PG.connect( :dbname => 'recipebox_test' )
  # else
  #   conn = PG.connect( :dbname => 'recipebox_production' )
  # end

  TRIGGER_TABLE = %{
    CREATE TABLE IF NOT EXISTS recipes(message text);
  }

  TRIGGER_FUNCTION = %{
  CREATE OR REPLACE FUNCTION notify_recipe_addition() RETURNS TRIGGER LANGUAGE plpgsql
  AS $$
      BEGIN
          NOTIFY cookbooks;
          RETURN NULL;
      END
  $$
  }

  DROP_TRIGGER = %{
  DROP TRIGGER IF EXISTS notify_trigger ON recipes
  }

  TRIGGER = %{
  CREATE TRIGGER notify_trigger AFTER INSERT ON recipes FOR EACH STATEMENT EXECUTE PROCEDURE notify_recipe_addition();
  }

  connection.execute( TRIGGER_TABLE )
  connection.execute( TRIGGER_FUNCTION )
  connection.execute( DROP_TRIGGER )
  connection.execute( TRIGGER )

  def self.on_recipe_add
    connection.execute( 'LISTEN cookbooks' )
    loop do
      connection.raw_connection.wait_for_notify do |cookbooks, pid, recipe|
        yield recipe
      end
    end
  ensure
    connection.execute "UNLISTEN cookbooks"
  end

end
