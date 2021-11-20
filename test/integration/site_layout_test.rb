require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example1)
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock(@user)
  end
  
  test "layout links" do
    get root_path
    assert_template "static_pages/home"
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", '/auth/google_oauth2'
    log_in_as(@user)
    assert_select "a[href=?]", '/auth/google_oauth2', count: 0
    assert_select "a[href=?]", log_out_path, count: 3
    assert_select "a[href=?]", root_path, count: 5
    assert_select "a[href=?]", new_lookback_path, count: 4
    assert_select "a[href=?]", lookbacks_path, count: 3
    assert_select "a[href=?]", reviews_path, count: 3
  end
  
end
