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
	 it "assigns the requested trial to @trial"
	 it "renders the :show template"
	  end

	describe 'GET #new' do
		it "assigns a new Trial to @trial"
		it "renders the :new template"
	end
end