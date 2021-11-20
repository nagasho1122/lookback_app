require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example1)
    @review = @user.reviews.create(content: "問題集1冊",
                                  deadline_at: DateTime.now )
    Rails.application.env_config["omniauth.auth"]  = google_oauth2_mock(@user)
  end
  
  test "should get index" do
    log_in_as(@user)
    get reviews_path
    assert_response :success
    assert_select "title", "Todo一覧 - カコモンバック"
  end
  
  #test "should  create review" do
   # log_in_as(@user)
    #get user_path(@user.id)
    #assert_template root_path
    #assert_difference "Review.count", 1 do
    #  post reviews_path, params: {review: {content: "問題集1冊",
    #                              deadline_at: DateTime.now}}
    #end
    #assert_not flash.empty?
  #end
  
  test "should redirect create when not logged in" do
    assert_no_difference "Review.count" do
      post reviews_path, params: {review: {content: "問題集1冊",
                                  deadline_at: DateTime.now}}
    end
    assert_redirected_to root_url
  end
  
end
