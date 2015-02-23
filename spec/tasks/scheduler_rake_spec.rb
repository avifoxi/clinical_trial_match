require 'rails_helper'
require 'rake'

describe 'importer namespace rake task' do
  before :all do
    Rake.application.rake_require "tasks/scheduler"
    Rake::Task.define_task(:environment)
  end

  it 'should not freak the fuck out' do 

  end
end