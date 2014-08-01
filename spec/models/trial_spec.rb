require "rails_helper"

describe Trial do
	it "is valid with all required attributes" do
		expect(build(:trial)).to be_valid
	end

	it "is invalid without a title" do
		expect(build(:trial, :title => "")).to_not be_valid
	end

	it "is invalid without a description" do
		expect(build(:trial, :description => "")).to_not be_valid
	end

	it "is invalid without a sponsor" do
		expect(build(:trial, :sponsor => "")).to_not be_valid
	end

	it "is invalid without a focus" do
		expect(build(:trial, :focus => "")).to_not be_valid
	end

	it "is invalid without a unique nct_id value" do
		create(:trial, :nct_id => "12345")
		expect(build(:trial, :nct_id => "12345")).to_not be_valid
	end

	it "is invalid without an inclusion criteria" do
		expect(build(:trial, :inclusion => "")).to_not be_valid
	end

	context "appends html markup" do
		it "adds header titles to criteria output" do
			trial = build(:trial, :inclusion => "\n\nInclusion Criteria:\n\n This is the a test sentence.\n\nExclusion Criteria:\n\n This is the a test sentence. ")
			output = trial.output_criteria
			expect(output).to include("<h4>Inclusion Criteria:</h4>")
			expect(output).to include("<h4>Exclusion Criteria:</h4>")
		end

		it "adds break tags to  detailed description output" do
			trial = build(:trial, :detailed_description => "\n\nSentence one.\n\n Sentence two.\n\n")
			output = trial.output_description
			expect(output).to include("<br><br>")
		end
	end

	context "handles age input" do
		it "floors half year values to integers" do
			trial = create(:trial, :originalminage => "6 months", :originalmaxage => "18 months")
			expect(trial.minimum_age).to eq(0)
			expect(trial.maximum_age).to eq(1)
		end

		it "floors full number values to integers" do
			trial = create(:trial, :originalminage => "12 months", :originalmaxage => "24 months")
			expect(trial.minimum_age).to eq(1)
			expect(trial.maximum_age).to eq(2)
		end
	end

	context "filters trial listing" do
		it "by #search_for" do
			trial1 = create(:trial, :title => "This is SpecialWord im looking up.")
			trial2 = create(:trial, :description => "This is specialword im looking up.")
			trial3 = create(:trial)
			expect(Trial.search_for("specialword")).to eq [trial1,trial2]
		end

		it "by #control?" do
			trial1 = create(:trial, :healthy_volunteers => "Accepts Healthy Volunteers")
			trial2 = create(:trial)
			expect(Trial.control?("control")).to eq [trial1]
		end

		context "by #gender" do
			before(:each) do
				@trial1 = create(:trial, :gender => "Male")
				@trial2 = create(:trial, :gender => "Female")
			end

			it "filters for males" do
				expect(Trial.gender("male")).to eq [@trial1]
			end

			it "filters for females" do
				expect(Trial.gender("female")).to eq [@trial2]
			end

			it "displays all with both filter" do
				expect(Trial.gender("both")).to eq [@trial1,@trial2]
			end
		end

		context "by #age" do
			it "filters by minimum_age" do
				trial_17 = create(:trial, :originalminage => "17", :originalmaxage => "100")
				trial_18 = create(:trial, :originalminage => "18", :originalmaxage => "100")
				trial_19 = create(:trial, :originalminage => "19", :originalmaxage => "100")
				expect(Trial.age(18)).to match_array([trial_17,trial_18])
			end

			it "filters by maximum_age" do
				trial_59 = create(:trial, :originalminage => "17", :originalmaxage => "59")
				trial_60 = create(:trial, :originalminage => "17", :originalmaxage => "60")
				trial_61 = create(:trial, :originalminage => "17", :originalmaxage => "61")
				expect(Trial.age(60)).to match_array([trial_60,trial_61])
			end
		end

		context "by #type" do
			before(:each) do
				@trial_interventional = create(:trial, :study_type => "Interventional")
				@trial_observational = create(:trial, :study_type => "Observational")
				@trial_patient_registry = create(:trial, :study_type => "Observational [Patient Registry]")
			end

			it "returns all if no filter parameter" do
				expect(Trial.type("all")).to match_array([@trial_interventional,@trial_observational,@trial_patient_registry])
			end

			it "filters by interventional" do
				expect(Trial.type("int")).to match_array([@trial_interventional])
			end

			it "filters by observational" do
				# Patient registry is a match for observational
				expect(Trial.type("obs")).to match_array([@trial_observational,@trial_patient_registry])
			end

		end

		context "by #phase" do
			before(:each) do
				@trial_phase_0 = create(:trial, :phase => "Phase 0")
				@trial_phase_1 = create(:trial, :phase => "Phase 1")
				@trial_phase_1_2 = create(:trial, :phase => "Phase 1/Phase 2")
				@trial_phase_2 = create(:trial, :phase => "Phase 2")
				@trial_phase_2_3 = create(:trial, :phase => "Phase 2/Phase 3")
				@trial_phase_3 = create(:trial, :phase => "Phase 3")
				@trial_phase_3_4 = create(:trial, :phase => "Phase 3/Phase 4")
				@trial_phase_4 = create(:trial, :phase => "Phase 4")
			end

			it "returns all if all phases are selected" do
				expect(Trial.phase("all")).to match_array([@trial_phase_0,@trial_phase_1,@trial_phase_1_2,@trial_phase_2,@trial_phase_2_3,@trial_phase_3,@trial_phase_3_4,@trial_phase_4])
			end

			it "returns phase 0 if selected" do
				expect(Trial.phase("0")).to match_array([@trial_phase_0])
			end

			it "returns phase 1 if selected" do
				expect(Trial.phase("1")).to match_array([@trial_phase_1,@trial_phase_1_2])
			end

			it "returns phase 2 if selected" do
				expect(Trial.phase("2")).to match_array([@trial_phase_2,@trial_phase_1_2,@trial_phase_2_3])
			end

			it "returns phase 3 if selected" do
				expect(Trial.phase("3")).to match_array([@trial_phase_3,@trial_phase_2_3,@trial_phase_3_4])
			end

			it "returns phase 4 if selected" do
				expect(Trial.phase("4")).to match_array([@trial_phase_4,@trial_phase_3_4])
			end
		end

		context "by fda" do
			before(:each) do
				@is_fda_regulated = create(:trial, :is_fda_regulated => "Yes")
				@is_not_fda_regulated = create(:trial, :is_fda_regulated => "No")
			end

			it "returns all fda types if all is selected" do
				expect(Trial.fda("all")).to match_array([@is_fda_regulated,@is_not_fda_regulated])
			end

			it "returns fda only if fda is selected" do
				expect(Trial.fda("reg")).to match_array([@is_fda_regulated])
			end

			it "returns non-fda only if non-fdafda is selected" do
				expect(Trial.fda("nreg")).to match_array([@is_not_fda_regulated])
			end
		end

	end
end