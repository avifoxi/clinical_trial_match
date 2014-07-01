require "rails_helper"

describe Trial do
	it "is invalid without a title" do
		# expect(Trial.new).to have(1).error_on(:title)
		expect(Trial.new).to_not be_valid
	end

	# it "has something else going on" do
	# 	pending
	# end
end