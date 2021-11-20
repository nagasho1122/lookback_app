require "test_helper"

class LookbackNewTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:example1)
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock(@user)
  end
  
  test "unsuccessful lookback new" do
    log_in_as(@user)
    get new_lookback_path
    assert_template 'lookbacks/new'
    post lookbacks_path, params: { lookback: { university: "", 
                                faculty: "理工学部", department: "機械工学科", year: 2020,  
                                all_text: "非常によくできた。特に後半の問題は全問正解。"} }
    assert_template "lookbacks/new"
    assert_not flash.empty?
  end
  
  test "successful new" do
    log_in_as(@user)
    get new_lookback_path
    assert_template 'lookbacks/new'
    post lookbacks_path, params: { lookback: { university: "東京大学", 
                                faculty: "理工学部", department: "機械工学科", year: 2020,  
                                all_text: "非常によくできた。特に後半の問題は全問正解。"} }
    assert_redirected_to user_path(@user)
    assert_not flash.empty?
  end
end
