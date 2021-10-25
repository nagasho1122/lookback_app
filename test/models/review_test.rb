require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @subject = subjects(:one)
    @user = users(:example1)
    @review = @subject.reviews.build(content: "単語帳 2周",  user_id: @user.id,
                    deadline_at: Time.zone.now)
  end
  
  test "should be valid" do
    assert @review.valid?
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
  
  test "order should be most late first" do
   assert_equal reviews(:most_late), Review.first
  end
end
