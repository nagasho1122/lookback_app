require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @lookback_detail = lookback_details(:example_lookback_detail1)
    @user = users(:example1)
    @review = @lookback_detail.reviews.build(content: "単語帳 2周",  user_id: @user.id,
                    deadline_at: Time.zone.now)
  end
  
  test "should be valid" do
    assert @review.valid?
  end
  
  test "lookback_detail_id should be present" do
    @review.lookback_detail_id = nil
    assert_not @review.valid?
  end
  
  test "user_id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end
  
  test "content should be present" do
    @review.content = "  "
    assert_not @review.valid?
  end
  
  test "deadline_at should be present" do
    @review.deadline_at = "  "
    assert_not @review.valid?
  end
  
  test "content should be at most 30 characters" do
    @review.content = "a" * 51
  end
  
  test "order should be most recent first" do
   assert_equal reviews(:most_recent), Review.first
  end
end
