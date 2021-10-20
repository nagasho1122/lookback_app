require "test_helper"

class LookbackDetailTest < ActiveSupport::TestCase
  def setup
    @subject = subjects(:one)
    @user = users(:example1)
    @lookback_detail = @subject.lookback_details.build(unit: "数学",  
                    number: 1, text:  "非常に難しかった。できなくて悔しい。")
  end
  
  test "should be valid" do
    assert @lookback_detail.valid?
  end
  
  
  test "unit should be present" do
    @lookback_detail.unit = "  "
    assert_not @lookback_detail.valid?
  end
  
  test "text should be present" do
    @lookback_detail.text = "  "
    assert_not @lookback_detail.valid?
  end
  
  test "unit should be at most 30 characters" do
    @lookback_detail.unit = "a" * 31
  end
  
  test "text should be at most 500 characters" do
    @lookback_detail.text = "a" * 501
  end
  
  test "order should be most recent first" do
   assert_equal lookback_details(:most_recent_details), LookbackDetail.first
  end
  
  
end
