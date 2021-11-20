require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example1)
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock(@user)
  end
  
  test "valid login" do
    get new_lookback_path
    assert_not flash.empty?
    get root_path
    log_in_as(@user)
    get new_lookback_path
    assert flash.empty?
  end
  
  test "valid login and logout" do
    get root_path
    log_in_as(@user)
    assert is_logged_in?
    assert_select "a[href=?]", '/auth/google_oauth2', count: 0
    get log_out_path
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", '/auth/google_oauth2'
    assert_not is_logged_in?
  end
end
