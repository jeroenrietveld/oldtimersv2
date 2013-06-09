class Question < ActiveRecord::Base
	has_many :labels, :dependent => :destroy

	accepts_nested_attributes_for :labels, :reject_if => lambda { |l| l[:title].blank? }, :allow_destroy => true
end
