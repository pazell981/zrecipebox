module ApplicationHelper

@title = "RecipeBox"

def random_background
  images = ["brownies.jpg", "cake.jpg", "cookies.jpg", "pasta.jpg", "sandwich.jpg", "spaghetti.jpg", "steak.jpg", "salad.jpg"]
  images[rand(images.size)]
end

def controller?(*controller)
	controller.include?(params[:controller])
end

def action?(*action)
	action.include?(params[:action])
end

end
