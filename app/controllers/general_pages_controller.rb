class GeneralPagesController < ApplicationController
	def home
		if user_signed_in?
			@question = Question.new
			@question.labels.build
		end
	end

	def register
		@user = User.new
		@company = Company.new
	end
end