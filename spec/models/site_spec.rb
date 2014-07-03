require "rails_helper"

describe Site do
	it "is valid with required attributes" do
		expect(FactoryGirl.build(:site)).to be_valid
	end

	it "is invalid without a facility" do
		expect(FactoryGirl.build(:site, :facility => "")).to_not be_valid
	end

	it "is invalid without a status" do
		expect(FactoryGirl.build(:site, :status => "")).to_not be_valid
	end

	it "formats address for geocoding" do
		site = FactoryGirl.build(:site, :city => "Hoboken",:state => "New Jersey",:country => "US",:zip_code => "07030")
		expect(site.address).to eq("Hoboken, New Jersey, US, 07030")
	end

	it "geocodes valid locations" do
		site = FactoryGirl.create(:site, :city => "Hoboken",:state => "New Jersey",:country => "US",:zip_code => "07030")
		expect(site.latitude).to eq(40.737159)
		expect(site.longitude).to eq(-74.030962)
	end
end