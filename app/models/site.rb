class Site < ActiveRecord::Base
	validates :facility, :status, presence: true
	belongs_to :trial

	#TODO? City is not populating in the database.
	geocoded_by :address, :lookup => :yandex
	after_validation :geocode

	def address
		[city, state, country, zip_code].compact.join(', ')
	end

end

