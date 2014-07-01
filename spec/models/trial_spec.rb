require "rails_helper"

describe Trial do
	it "is valid with required attributes" do
		expect(FactoryGirl.build(:trial)).to be_valid
	end

	it "requires a title" do
		expect(FactoryGirl.build(:trial, :title => "")).to_not be_valid
	end

	it "requires a description" do
		expect(FactoryGirl.build(:trial, :description => "")).to_not be_valid
	end

	it "requires a sponsor" do
		expect(FactoryGirl.build(:trial, :sponsor => "")).to_not be_valid
	end

	it "requires a focus" do
		expect(FactoryGirl.build(:trial, :focus => "")).to_not be_valid
	end

	it "requires a nct_id" do
		expect(FactoryGirl.build(:trial, :focus => "")).to_not be_valid
	end


end