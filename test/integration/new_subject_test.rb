require "test_helper"

class NewSubjectTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:example1)
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock(@user)
  end
  
  #subjectの中身なしで科目を空欄にして送信しても、データにsubjectが送信されないため、unsuccessのテストは必要なし。
  #subjects_attributesのhashの最初の値は、送信時の日付に起因する文字列が入る。
  test "successful subject new" do
    log_in_as(@user)
    get new_lookback_path
    assert_template 'lookbacks/new'
    assert_difference "Subject.count", 1 do
      post lookbacks_path, params: { lookback: { university: "東京大学", 
                                  faculty: "理工学部", department: "機械工学科", year: 2020,  
                                  all_text: "非常によくできた。特に後半の問題は全問正解。",
                                  subjects_attributes: {"0": {subject: "国語", _destroy: false}}} }
    end
    assert_redirected_to user_path(@user)
    assert_not flash.empty?
  end
  
  
end
