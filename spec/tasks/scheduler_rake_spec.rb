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
  		# puts 'import here::::'
  		# p "#{Import.last.datetime.year.inspect}"
  		expect(imp.datetime.year).to eq(1900)
  		expect(imp.valid_trials).to eq(0)
  		expect(imp.valid_sites).to eq(0)
  	end
  end

  describe 'importer:test_email' do 

  end
end