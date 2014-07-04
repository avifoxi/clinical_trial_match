require "rails_helper"

describe ImporterController do

	before :each do
		@user = build(:user)
		@user.skip_confirmation!
		@user.save
		sign_in @user
	end

	describe 'GET #show' do
		it "displays the last import" do
			import = create(:import)
			get :show
			expect(assigns(:import)).to eq(import)
		end

		it "displays all trials count" do
			trial1 = create(:trial)
			trial2 = create(:trial)
			trial3 = create(:trial)
			get :show
			expect(assigns(:trials)).to eq [trial1,trial2,trial3]
		end

		it "displays all sites count" do
			site1 = create(:site)
			site2 = create(:site)
			site3 = create(:site)
			get :show
			expect(assigns(:sites)).to eq [site1,site2,site3]
		end

		it "renders the :show template" do
			get :show
			expect(response).to render_template :show
		end

	end

	describe 'POST #delete_all' do
		it "deletes all trials and sites" do
			trial = create(:trial)
			site = create(:site)
			post :delete_all
			expect(Trial.all).to be_empty
			expect(Site.all).to be_empty

		end

		it "redirects to importer#show" do
			post :delete_all
			expect( response). to redirect_to importer_path
		end
	end

	describe 'POST #clear_date' do
		it "clears valid trials, sites and import date" do
			build(:import)
			post :clear_date
			expect(Import.last.datetime).to eq("Mon, 1 Jan 1900 00:00:04 UTC +00:00")
			expect(Import.last.valid_trials).to eq(0)
			expect(Import.last.valid_sites).to eq(0)
		end

		it "redirects to importer#show" do
			post :delete_all
			expect( response). to redirect_to importer_path
		end
	end

	describe 'POST #run'

end