require "rails_helper"

describe ImporterController do
	describe 'GET #show' do
		it "displays the trial, site and import counts" do
			get :show
			binding.pry
		end
	end

	describe 'POST #delete_all' do
		it "deletes all trials and sites" do
		end
	end


end