# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( categories.js )
Rails.application.config.assets.precompile += %w( comments.js )
Rails.application.config.assets.precompile += %w( cookbooks.js )
Rails.application.config.assets.precompile += %w( friends.js )
Rails.application.config.assets.precompile += %w( friendsbox.js )
Rails.application.config.assets.precompile += %w( recipebox.js )
Rails.application.config.assets.precompile += %w( recipes.js )
Rails.application.config.assets.precompile += %w( recipes2.js )
Rails.application.config.assets.precompile += %w( sessions.js )
Rails.application.config.assets.precompile += %w( users.js )
Rails.application.config.assets.precompile += %w( jquery.scrollTo-1.4.2-min.js )
Rails.application.config.assets.precompile += %w( navbar2.js )
Rails.application.config.assets.precompile += %w( waypoints.js )
Rails.application.config.assets.precompile += %w( jquery.tablesorter.js )