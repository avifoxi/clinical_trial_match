require "rails_helper"

describe Trial do
	it "has something going on" do
		pending
		trial = Trial.new
		expect(trial.save).to_have(3).failures
	end

	it "has something else going on" do
		pending
	end
end