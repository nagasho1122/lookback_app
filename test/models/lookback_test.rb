require "test_helper"

class LookbackTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:example1)
    @lookback = @user.lookbacks.build(university: "東京大学", faculty: "理工学部",
                    department: "機械工学科", year: 2020,  
                    all_text: "非常によくできた。特に後半の問題は全問正解。")
  end
  
  test "should be valid" do
    assert @lookback.valid?
  end
  
  test "user_id should be present" do
    @lookback.user_id = nil
    assert_not @lookback.valid?
  end
  
  test "university should be present" do
    @lookback.university = "  "
    assert_not @lookback.valid?
  end
  
  test "faculty should be present" do
    @lookback.faculty = "  "
    assert_not @lookback.valid?
  end
  
  test "department should be present" do
    @lookback.department = " "
    assert_not @lookback.valid?
  end
  
  test "year should be present" do
    @lookback.year = nil
    assert_not @lookback.valid?
  end
  
  test "all_text should be present" do
    @lookback.all_text = nil
    assert_not @lookback.valid?
  end
  
  test "university should be at most 30 characters" do
    @lookback.university = "a" * 31
  end
  
  test "faculty should be at most 30 characters" do
    @lookback.faculty = "a" * 31
  end
  
  test "department should be at most 30 characters" do
    @lookback.department = "a" * 31
  end
  
  test "all_text should be at most 500 characters" do
    @lookback.all_text = "a" * 501
  end
  
  test "order should be most recent first" do
    assert_equal lookbacks(:most_recent), Lookback.first
  end
  
  
end
