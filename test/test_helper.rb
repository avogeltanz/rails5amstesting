ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def not_found(klass, id)
    file_fixture('404.json').read.gsub(/klass/, klass).gsub(/\'id\'=/, "'id'=#{id}")
  end
end
