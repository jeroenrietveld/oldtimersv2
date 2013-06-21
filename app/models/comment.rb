class Comment < ActiveRecord::Base
	belongs_to :answer
	belongs_to :user

	make_flaggable :like
end
