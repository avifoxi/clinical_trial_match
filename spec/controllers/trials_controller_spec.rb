require "rails_helper"

describe TrialsController do
	describe 'GET #index' do
		context 'with params' do
			it "populates an array of contacts starting with the letter"
			it "renders the :index template"
		end

		context 'without params' do
			it "populates a paginated array of all trials"
			it "renders the :index template"
		end
	end

	describe 'GET #show' do
		it "assigns the requested trial to @trial" do
			trial = create(:trial)
			get :show, id: trial
			expect(assigns(:trial)). to eq trial
		end

		it "renders the :show template" do
			trial = create(:trial)
			get :show, id: trial
			expect(response).to render_template :show
		end
	end

	describe 'GET #new' do
		it "assigns a new Trial to @trial"
		it "renders the :new template"
	end
end