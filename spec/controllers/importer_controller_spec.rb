require "rails_helper"

describe ImporterController do
	describe 'GET #show' do
		it "displays the last import" do
			import = create(:import)
			get :show
			# binding.pry
			expect(assigns(:import)). to eq(import)
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