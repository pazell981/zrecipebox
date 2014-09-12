class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates :name,    		:presence   => true,
	          :format               		=> { :with => /\A([A-Za-z\s]*)\z/i}
	
	validates :quantity, 		:presence		=> true,
						:format     => { :with => /\A([A-Za-z\s]*)\z/i }

end
