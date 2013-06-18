module QuestionsHelper
	def get_like_image(entity)
		if current_user.flagged?(entity, :like)
			return "thumbs_up_highlight.png"
		else
			return "thumbs_up.png"
		end
	end
end
