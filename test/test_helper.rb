ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def input(network)
    message = ""
    File.open "test/fixtures/files/#{network}_payload.json", "r" do |f|
      f.each_line do |line|
        message += line
      end
    end
    message
  end

  def output(network)
    message = ""
    File.open "test/fixtures/files/#{network}_social_activity.json", "r" do |f|
      f.each_line do |line|
        message += line
      end
    end
    message
  end
end
