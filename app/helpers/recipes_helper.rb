module RecipesHelper
	def newLineSplit(content)
		return content.split(/\r\n/)
	end
	def spaceSplit(content)
		return content.split(" ", 2)
	end
end
