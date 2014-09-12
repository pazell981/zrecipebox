class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :comment,    		:presence   => true,
            :format               		=> { :with => /\A([A-Za-z\s\d\D]*)\z/i}

end
