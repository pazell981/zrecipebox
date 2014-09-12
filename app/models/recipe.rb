class Recipe < ActiveRecord::Base

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
	          :format               		=> { :with => /\A([A-Za-z\s]*)\z/i}
	
	validates :description, :format     => { :with => /\A([A-Za-z\s]*)\z/i}
	
	has_attached_file :image, :styles 	=> { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  validates :yield,   		:format     => { :with => /\A([\dA-Za-z\s]*)\z/i }
  
  validates :actual_time, :allow_blank => true,
  					:format			=> { :with => /\d*[:]\d\d/, :message => "Please enter times in HH:MM format. "}

  validates :total_time, 	:allow_blank => true,
  					:format			=> { :with => /\d*[:]\d\d/, :message => "Please enter times in HH:MM format. "}

  validates :source, 			:format			=> { :with => /\A([\dA-Za-z\s]*)\z/i }

  validates :instructions,:presence		=> true

  

end
