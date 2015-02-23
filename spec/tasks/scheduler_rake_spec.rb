require 'rails_helper'
require 'rake'

describe 'importer namespace rake task' do
  before :all do
    Rake.application.rake_require "tasks/scheduler"
    Rake::Task.define_task(:environment)
  end

  describe 'importer:clear_import_date' do 
  	it 'resets import date to 1900, resets trials and sites to 0' do
  		Rake::Task["importer:clear_import_date"].reenable
  		Rake.application.invoke_task "importer:clear_import_date"
  		imp = Import.last
  		expect(imp.datetime.year).to eq(1900)
  		expect(imp.valid_trials).to eq(0)
  		expect(imp.valid_sites).to eq(0)
  	end
  end

  describe 'importer:test_email' do 
  	it 'does not run any tests... bc email not configured over here' do 
  		'skip me!'
  	end
  end

  describe 'importer:rewind_import_date' do
  	it 'does' do 

  		ENV['amount_of_time'] = '100'
	  	Rake::Task["importer:rewind_import_date"].reenable
	  	Rake.application.invoke_task("importer:rewind_import_date")


	  end
  end

end




















