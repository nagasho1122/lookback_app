require "test_helper"

class LookbacksControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example1)
    @other_user = users(:example2)
    @other_lookback = lookbacks(:two)
    @lookback = lookbacks(:one)
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock(@user)
  end
  
  test "should redirect some page when not logged in" do
    get lookback_path(@lookback)
    assert_not flash.empty?
    assert_redirected_to root_url
    get edit_lookback_path(@lookback)
    assert_not flash.empty?
    assert_redirected_to root_url
    get lookbacks_path
    assert_not flash.empty?
    assert_redirected_to root_url
  end
  
  test "should get show" do
    log_in_as(@user)
    get lookback_path(@lookback)
    assert_response :success
    assert_select "title", "振り返り - カコモンバック"
  end
  
  test "should get edit" do
    log_in_as(@user)
    get edit_lookback_path(@lookback)
    assert_response :success
    assert_select "title", "振り返り編集 - カコモンバック"
  end
  
  test "should get index" do
    log_in_as(@user)
    get lookbacks_path
    assert_response :success
    assert_select "title", "振り返り一覧 - カコモンバック"
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference "Lookback.count" do
      post lookbacks_path, params: {lookback: {university: "東京大学", faculty: "理工学部",
                    department: "機械工学科", year: 2020,  
                    all_text: "非常によくできた。特に後半の問題は全問正解。"}}
    end
    assert_redirected_to root_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference "Lookback.count" do
      delete lookback_path(@lookback)
    end
    assert_redirected_to root_url
  end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@user)
    get edit_lookback_path(@other_lookback)
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect show when logged in as wrong user" do
    log_in_as(@user)
    get lookback_path(@other_lookback)
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect update when logged in as wrong user" do
    log_in_as(@user)
    patch lookback_path(@other_lookback), params: {lookback: {university: "東京大学", faculty: "理工学部",
                    department: "機械工学科", year: 2021,  
                    all_text: "非常によくできた。特に後半の問題は全問正解。"}}
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect destroy when logged in as wrong user" do
    log_in_as(@user)
    delete lookback_path(@other_lookback)
    assert flash.empty?
    assert_redirected_to root_url
  end
  
end
