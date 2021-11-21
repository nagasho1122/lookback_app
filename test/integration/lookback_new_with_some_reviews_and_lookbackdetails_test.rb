require "test_helper"

class LookbackNewWithSomeReviewsAndLookbackdetailsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:example1)
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock(@user)
  end

  test "successful lookback new  add something with lookback_new" do
    log_in_as(@user)
    get new_lookback_path
    assert_template 'lookbacks/new'
    assert_difference ->{ Subject.count } => 1, ->{ Review.count } => 2, ->{ LookbackDetail.count } => 2 do
      post lookbacks_path, params: { lookback: { university: "東京大学", 
                                  faculty: "理工学部", department: "機械工学科", year: 2020,  
                                  all_text: "非常によくできた。特に後半の問題は全問正解。",
                                  subjects_attributes: {"0": {subject: "国語", _destroy: false, 
                                  lookback_details_attributes: {"1":{unit: "微分", number: 1, text: "できた。", _destroy: false},
                                  "2":{unit: "積分", number: 2, text: "できた。", _destroy: false}},
                                  reviews_attributes: {"1":{content: "問題集", deadline_at: Time.zone.now, _destroy: false, user_id: @user.id},
                                  "2":{content: "問題集2", deadline_at: Time.zone.now, _destroy: false, user_id: @user.id}}}}}}
    end
    assert_redirected_to user_path(@user)
    assert_not flash.empty?
  end
end
