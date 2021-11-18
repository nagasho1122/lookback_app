require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example1)
  end
  
  test "layout links" do
    get root_path
    assert_template "static_pages/home"
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", log_out_path
    #ログインする
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", new_lookback_path
    assert_select "a[href=?]", lookbacks_path
    assert_select "a[href=?]", reviews_path
    assert_select "a[href=?]", user_path(@user)
  end
  
end
