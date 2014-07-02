require "rails_helper"

describe Site do
	it "is valid with required attributes" do
		expect(FactoryGirl.build(:site)).to be_valid
	end

end