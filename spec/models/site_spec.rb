require "rails_helper"

describe Site do
	context "has validation that" do
		it "is valid with required attributes" do
			expect(FactoryGirl.build(:site)).to be_valid
		end

		it "requires a facility" do
			expect(FactoryGirl.build(:site, :facility => "")).to_not be_valid
		end

		it "requires a status" do
			# binding.pry
			expect(FactoryGirl.build(:site, :status => "")).to_not be_valid
		end
	end

	it "geocodes valid locations" do
		site = FactoryGirl.create(:site, :street_address => "205 Hudson St", :city => "Hoboken",:state => "New Jersey",:country => "US",:zip_code => "07030")
		expect(site.latitude).to eq(40.737159)
		expect(site.longitude).to eq(-74.030962)
	end
end