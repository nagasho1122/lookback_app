require "test_helper"

class TrialLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:trial)
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock(@user)
  end
  
  test "valid trial login" do
    get root_path
    get trial_login_path
    assert_redirected_to root_path
    follow_redirect!
    get new_lookback_path
    assert_response :success
    assert flash.empty?
  end
  
  
  test "valid trial login and logout" do
    get root_path
    get trial_login_path
    follow_redirect!
    assert is_logged_in?
    assert_select "a[href=?]", trial_login_path, count: 0
    get log_out_path
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", trial_login_path
    assert_not is_logged_in?
  end
end
