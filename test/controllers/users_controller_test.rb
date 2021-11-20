require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example1)
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock(@user)
  end
  
  test "should get show" do
    log_in_as(@user)
    get user_path(@user)
    assert_response :success
    assert_select "title", "マイページ - カコモンバック"
  end
end
