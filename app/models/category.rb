class Category < ActiveRecord::Base
  belongs_to :user
  has_many :recipes, through: :recipe_categories
  has_many :recipe_categories

  validates :category,    		:presence   => true,
	          :format               		=> { :with => /\A([A-Za-z\s]*)\z/i}
end
