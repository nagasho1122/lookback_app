require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  
  def setup
    @subject = subjects(:example)
    @user = users(:example1)
  end
  
  test "subject should be present" do
    @subject.subject = "  "
    assert_not @subject.valid?
  end
  
  test "associated reviews should be destroy" do
    @subject.save
    @subject.reviews.create!(content: "単語帳 2周",  user_id: @user.id,
                    deadline_at: Time.zone.now)
    assert_difference "Review.count", -1 do
      @subject.destroy
    end
  end
  
  test "associated lookback_details should be destroy" do
    @subject.save
    @subject.lookback_details.create!(unit: "数学",  
                    number: 1, text:  "非常に難しかった。できなくて悔しい。")
    assert_difference "LookbackDetail.count", -1 do
      @subject.destroy
    end
  end
end
