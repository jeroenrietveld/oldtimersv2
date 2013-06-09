class Question < ActiveRecord::Base
	has_many :labels, :dependent => :destroy

	accepts_nested_attributes_for :labels
end
