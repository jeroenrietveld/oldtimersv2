class GeneralPagesController < ApplicationController
	def home
		if user_signed_in?
			@question = Question.new
		end
	end
end
