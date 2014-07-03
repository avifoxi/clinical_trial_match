require "rails_helper"

describe TrialsController do
	describe 'GET #index' do
		before(:each) do
			@trial1 = create(:trial, :title => "B title",  :lastchanged_date => 3.days.ago)
			@trial2 = create(:trial, :title => "A title", :lastchanged_date => 2.days.ago)
			@trial3 = create(:trial, :title => "C title", :lastchanged_date => 1.days.ago)
		end

		context 'with order params' do
			it "populates an array of trials in alphabetical order" do
				get :index, {:ot => 'title ASC'}
				expect(assigns(:trials)).to eq([ @trial2, @trial1, @trial3])
			end

			it "populates an array of trials in date order" do
				get :index, {:ot => 'lastchanged_date DESC'}
				expect(assigns(:trials)).to eq([ @trial3, @trial2, @trial1])
			end
		end

		context 'without params' do
			it "populates a paginated array of all trials in reverse date order" do
				get :index
				expect(assigns(:trials)).to eq([ @trial3, @trial2, @trial1])
			end

			it "renders the :index template" do
				get :index
				expect(response).to render_template :index
			end
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