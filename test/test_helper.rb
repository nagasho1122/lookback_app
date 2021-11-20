ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here..
  include ApplicationHelper
  
  OmniAuth.config.test_mode = true
  
  def google_oauth2_mock
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    :provider => 'google_oauth2',
    :uid => '1235456789',
    :info => {
      :name => 'JohnDoe',
      :email => "abc@gmail.com",
      :image => "/fixtures/test_icon.jpg"}
    })
  end
  
  def is_logged_in?
    !session[:user_id].nil?
  end
  
  
end

class ActionDispatch::IntegrationTest

  # テストユーザーとしてログインする
  def log_in_as(user)
    post "/auth/google_oauth2"
    assert_redirected_to "/auth/google_oauth2/callback"
    follow_redirect!
    assert_redirected_to root_path
    follow_redirect!
  end
end
