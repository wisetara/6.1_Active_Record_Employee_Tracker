require 'active_record'
require 'task'
require 'create_lists'
require 'shoulda-matchers'
require 'list'
require 'rspec'
require 'pry'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Task.all.each { |task| task.destroy }
  end
end
