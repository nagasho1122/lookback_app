require "test_helper"

class DoneTest < ActiveSupport::TestCase
  def setup
    @user = users(:example1)
    @review = reviews(:one)
    @done = @user.dones.build(done_review_id: @review.id)
  end
  
  test "should be valid" do
    
    assert @done.valid?
  end
  
  test "valid done_review_id" do
    @done.done_review_id = nil 
    assert_not @done.valid?
  end
  
end
