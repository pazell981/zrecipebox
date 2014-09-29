class CookbooksController < ApplicationController
  
	include ActionController::Live

	before_action :require_login

	def index
    @subtitle = "Explore the Cookbook"
    @cookbooks = Recipe.where("public!='yes'").paginate(page: params[:page], per_page: 15).order('created_at DESC')
	end

	def stream
    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'
    # 5.times do |n|
    # 	response.stream.write( "data: #{n}...\n\n")
    # 	sleep 2
    # end
    Recipe.on_recipe_add do |recipe|
      response.stream.write(sse({recipe: recipe}, {event: 'recipe'}))
    end
  rescue IOError
    # When the client disconnects, we'll get an IOError on write
  ensure
    response.stream.close
  end

  def require_login
    unless signed_in?
      deny_access
    end
  end
  
  private
  def sse(object, options = {})
    (options.map{|k,v| "#{k}: #{v}" } << "data: #{JSON.dump object}").join("\n")
  end

end
