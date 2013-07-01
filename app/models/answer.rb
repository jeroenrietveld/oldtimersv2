class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	belongs_to :company

	has_many :comments

	validates :question_id, presence: true
	validates :description, presence: true
	validates :user, presence: true

	make_flaggable :like

	attr_accessible :description
end
