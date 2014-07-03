class Import < ActiveRecord::Base
	validates :datetime, :valid_trials, :valid_sites, presence: true
end
