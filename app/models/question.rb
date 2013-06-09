class Question < ActiveRecord::Base
	validates :title, presence: true
	validates :description, presence: true
	validates :labels, presence: true
	validates :categories, presence: true

	has_and_belongs_to_many :categories
	has_many :labels, :dependent => :destroy

	accepts_nested_attributes_for :categories, :reject_if => lambda { |l| l[:title].blank? }, allow_destroy: true
	accepts_nested_attributes_for :labels, :reject_if => lambda { |l| l[:title].blank? }, :allow_destroy => true
end
