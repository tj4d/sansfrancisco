class Job < ActiveRecord::Base
	validates :companyName, presence: true
	validates :positionTitle, presence: true
	validates :positionDescription, presence: true
	validates :location, presence: true
	validates :url, presence: true
end
