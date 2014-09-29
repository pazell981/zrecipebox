module RecipesHelper
	
	def headerSplit(content)
		content.slice!("{")
		content.slice!("}")
		return content
	end

	def headerTest(content)
		if content[0,1]=="{"
			return TRUE
		else
			return FALSE
		end
	end

	def letterTest(content)
		alphabet = ('a'..'z').to_a
		if alphabet.include?(content[0,1].downcase)
			return TRUE
		else
			return FALSE
		end
	end

	def newLineSplit(content)
		return content.split(/\r\n/)
	end

	def spaceSplit(content)
		return content.split(" ", 2)
	end

end
