require "rails_helper"

describe Trial do
	it "is valid with all required attributes" do
		expect(FactoryGirl.build(:trial)).to be_valid
	end

	it "is invalid without a title" do
		expect(FactoryGirl.build(:trial, :title => "")).to_not be_valid
	end

	it "is invalid without a description" do
		expect(FactoryGirl.build(:trial, :description => "")).to_not be_valid
	end

	it "is invalid without a sponsor" do
		expect(FactoryGirl.build(:trial, :sponsor => "")).to_not be_valid
	end

	it "is invalid without a focus" do
		expect(FactoryGirl.build(:trial, :focus => "")).to_not be_valid
	end

	it "is invalid without a unique nct_id value" do
		FactoryGirl.create(:trial, :nct_id => "12345")
		expect(FactoryGirl.build(:trial, :nct_id => "12345")).to_not be_valid
	end

	it "is invalid without an inclusion criteria" do
		expect(FactoryGirl.build(:trial, :inclusion => "")).to_not be_valid
	end

	context "appends html markup" do
		it "adds header titles to criteria output" do
			trial = FactoryGirl.build(:trial, :inclusion => "\n\nInclusion Criteria:\n\n This is the a test sentence.\n\nExclusion Criteria:\n\n This is the a test sentence. ")
			output = trial.output_criteria
			expect(output).to include("<h4>Inclusion Criteria:</h4>")
			expect(output).to include("<h4>Exclusion Criteria:</h4>")
		end

		it "adds break tags to  detailed description output" do
			trial = FactoryGirl.build(:trial, :detailed_description => "\n\nSentence one.\n\n Sentence two.\n\n")
			output = trial.output_description
			expect(output).to include("<br><br>")
		end
	end

	context "handles age input" do
		it "floors half year values to integers" do
			trial = FactoryGirl.create(:trial, :originalminage => "6 months", :originalmaxage => "18 months")
			expect(trial.minimum_age).to eq(0)
			expect(trial.maximum_age).to eq(1)
		end

		it "floors full number values to integers" do
			trial = FactoryGirl.create(:trial, :originalminage => "12 months", :originalmaxage => "24 months")
			expect(trial.minimum_age).to eq(1)
			expect(trial.maximum_age).to eq(2)
		end
	end
end