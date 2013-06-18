class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user

	validates :question_id, presence: true
	validates :description, presence: true
	validates :user, presence: true

	make_flaggable :like
end
