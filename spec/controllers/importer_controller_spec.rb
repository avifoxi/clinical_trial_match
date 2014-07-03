require "rails_helper"

describe ImporterController do
	describe 'GET #show' do
		it "displays the last import" do
			import = create(:import)
			get :show
			expect(assigns(:import)). to eq(import)
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
		end
	end


end