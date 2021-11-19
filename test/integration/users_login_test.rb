require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example1)
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock
  end
  
  test "valid login" do
    get root_path
    log_in_as(@user)
    get reviews_path
    assert_response :success
  end
end
