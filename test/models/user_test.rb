require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "ボブ子", email: "abc@gmail.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end
  
  
  test "associated lookbacks should be destroy" do
    @user.save
    @user.lookbacks.create!(university: "東京大学", faculty: "理工学部",
                    department: "機械工学科", year: 2020,  
                    all_text: "非常によくできた。特に後半の問題は全問正解。")
    assert_difference "Lookback.count", -1 do
      @user.destroy
    end
  end
  
  test "associated reviews should be destroy" do
    @user.save
    @user.reviews.create!(content: "単語帳 2周",  subject_id: subjects(:one).id,
                    deadline_at: Time.zone.now)
    assert_difference "Review.count", -1 do
      @user.destroy
    end
  end
end
