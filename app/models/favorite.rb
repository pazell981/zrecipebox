class Favorite < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  has_many :recipes
end
