class GeneralPagesController < ApplicationController
	def home
		if user_signed_in?
			@question = Question.new
			@question.labels.build
		end
	end
end
