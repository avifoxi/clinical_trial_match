class Site < ActiveRecord::Base
	validates :facility, :status, presence: true
	belongs_to :trial

	geocoded_by :address, :lookup => :yandex
	after_validation :geocode

	def address
		[city, state, country, zip_code].compact.join(', ')
	end

end

