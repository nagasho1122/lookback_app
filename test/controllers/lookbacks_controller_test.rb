require "test_helper"

class LookbacksControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example1)
    @lookback = @user.lookbacks.create(university: "東京大学", faculty: "理工学部",
                    department: "機械工学科", year: 2020,  
                    all_text: "非常によくできた。特に後半の問題は全問正解。")
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock(@user)
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
end
