require 'rails_helper'

feature "Search", :type => :feature do
	before(:each) do
		@nyc_trial = create(:trial)
		@nyc_trial.sites<<(create(:site,:city => "New York",:state => "New York",:country => "United States",:zip_code => "10018"))

		@hoboken_trial = create(:trial)
		@hoboken_trial.sites<<(create(:site,:city => "Hoboken",:state => "New Jersey",:country => "United States",:zip_code => "07030"))

		@sf_trial = create(:trial)
		@sf_trial.sites<<(create(:site,:city => "San Francisco",:state => "California",:country => "United States",:zip_code => "91604"))
	end

	scenario "provides valid zip code search filters" do
		visit "/trials"

		fill_in "pc", with: "07030"
		click_button "Search Trials"

		expect(page).to have_text("You match to 2 trials today")
	end

	scenario "provides error handling if no matches" do
		visit "/trials"

		fill_in "pc", with: "58001"
		click_button "Search Trials"

		expect(page).to have_text("Your search returned no results")
	end

	scenario "links to trial details with site info", js: true do
		visit "/trials"

		expect(page).to have_text(@nyc_trial.title)

		click_link @nyc_trial.title
		expect(page).to have_text(@nyc_trial.description)

		expect(page).to_not have_text(@nyc_trial.output_description)
		find("#expandFullLink").click
		expect(page).to have_text(@nyc_trial.output_description)

		expect(page).to_not have_text(@nyc_trial.output_criteria)
		find("#expandExclusion").click
		expect(page).to have_text(@nyc_trial.output_criteria)
	end
end
