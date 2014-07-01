require "rails_helper"

describe Trial do
	it "is invalid when empty" do
		expect(Trial.new).to_not be_valid
	end

	it "requires a title" do
		# expect(Trial.new).to have(1).error_on(:title)
		expect(Trial.new.error_on(:title).size).to eq(1)
	end

	# it "has something else going on" do
	# 	pending
	# end
end