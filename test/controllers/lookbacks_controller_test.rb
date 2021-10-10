require "test_helper"

class LookbacksControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example1)
    @lookback = @user.lookbacks.create(university: "東京大学", faculty: "理工学部",
                    department: "機械工学科", year: 2020,  
                    all_text: "非常によくできた。特に後半の問題は全問正解。")
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference "Lookback.count" do
      post lookbacks_path, params: {lookback: {university: "東京大学", faculty: "理工学部",
                    department: "機械工学科", year: 2020,  
                    all_text: "非常によくできた。特に後半の問題は全問正解。"}}
    end
    assert_redirected_to root_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference "Lookback.count" do
      delete lookback_path(@lookback)
    end
    assert_redirected_to root_url
  end
end
