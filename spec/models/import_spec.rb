require "rails_helper"

describe Import do
	it "is valid with all required attributes" do
		expect(build(:import)).to be_valid
	end

	it "is invalid without a datetime" do
		expect(build(:import, :datetime => "")).to_not be_valid
	end

	it "is invalid without a valid_trials" do
		expect(build(:import, :valid_trials => "")).to_not be_valid
	end

	it "is invalid without a valid_sites" do
		expect(build(:import, :valid_sites => "")).to_not be_valid
	end

end