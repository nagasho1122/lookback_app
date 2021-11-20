require "test_helper"

class LookbackEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:example1)
    @lookback = lookbacks(:one)
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock
  end
  
  test "unsuccessful lookback edit" do
    log_in_as(@user)
    get edit_lookback_path(@lookback)
    assert_template 'lookbacks/edit'
    patch lookback_path(@lookback), params: { lookback: { university: "", 
                                faculty: "理工学部", department: "機械工学科", year: 2020,  
                                all_text: "非常によくできた。特に後半の問題は全問正解。"} }
    assert_template "lookbacks/edit"
  end
  
  test "successful edit" do
    log_in_as(@user)
    get edit_lookback_path(@lookback)
    assert_template 'lookbacks/edit'
    university = "大阪大学"
    patch lookback_path(@lookback), params: { lookback: { university: university, 
                                faculty: "理工学部", department: "機械工学科", year: 2020,  
                                all_text: "非常によくできた。特に後半の問題は全問正解。"} }
    assert_not flash.empty?
    assert_redirected_to lookback_path(@lookback)
    @lookback.reload
    assert_equal @lookback.university, university
  end
end
