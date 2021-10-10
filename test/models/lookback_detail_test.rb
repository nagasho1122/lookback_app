require "test_helper"

class LookbackDetailTest < ActiveSupport::TestCase
  def setup
    @lookback = lookbacks(:most_recent)
    @user = users(:example1)
    @lookback_detail = @lookback.lookback_details.build(subject: "数学",  
                    number: 1, text:  "非常に難しかった。できなくて悔しい。")
  end
  
  test "should be valid" do
    assert @lookback_detail.valid?
  end
  
  test "lookback_id should be present" do
    @lookback_detail.lookback_id = nil
    assert_not @lookback_detail.valid?
  end
  
  test "subject should be present" do
    @lookback_detail.subject = "  "
    assert_not @lookback_detail.valid?
  end
  
  test "text should be present" do
    @lookback_detail.text = "  "
    assert_not @lookback_detail.valid?
  end
  
  test "subject should be at most 30 characters" do
    @lookback_detail.subject = "a" * 31
  end
  
  test "text should be at most 500 characters" do
    @lookback_detail.text = "a" * 501
  end
  
  test "order should be most recent first" do
   assert_equal lookback_details(:most_recent_details), LookbackDetail.first
  end
  
  test "associated reviews should be destroy" do
    @lookback_detail.save
    @lookback_detail.reviews.create!(content: "単語帳 2周",  user_id: @user.id,
                    deadline_at: Time.zone.now)
    assert_difference "Review.count", -1 do
      @lookback_detail.destroy
    end
  end
  
end
