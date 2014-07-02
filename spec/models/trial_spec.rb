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

	it "requires a unique nct_id value" do
		FactoryGirl.create(:trial, :nct_id => "12345")
		expect(FactoryGirl.build(:trial, :nct_id => "12345")).to_not be_valid
	end

	it "requires an inclusion criteria" do
		expect(FactoryGirl.build(:trial, :inclusion => "")).to_not be_valid
	end

	it "adds html markup to the description output" do
		trial = FactoryGirl.build(:trial, :inclusion => "\n\nInclusion Criteria:\n\n This is the a test sentence.\n\nExclusion Criteria:\n\n This is the a test sentence. ")
		output = trial.output_criteria
		expect(output).to include("<h4>Inclusion Criteria:</h4>")
		expect(output).to include("<h4>Exclusion Criteria:</h4>")
	end


end