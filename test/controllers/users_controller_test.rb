require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example1)
    @other_user = users(:example2)
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock(@user)
  end
  
  test "should get show" do
    log_in_as(@user)
    get user_path(@user)
    assert_response :success
    assert_select "title", "マイページ - カコモンバック"
  end
  
  test "should redirect show when logged in as wrong user" do
    log_in_as(@user)
    get user_path(@other_user)
    assert flash.empty?
    assert_redirected_to root_url
  end
end
