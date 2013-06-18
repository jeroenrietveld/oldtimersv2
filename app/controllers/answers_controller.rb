class AnswersController < ApplicationController
	def like
		setAnswer

		current_user.flag(@answer, :like)

		return render :json => true
	end

	private

		def setAnswer
			@answer = Answer.find(params[:id])
		end
end
