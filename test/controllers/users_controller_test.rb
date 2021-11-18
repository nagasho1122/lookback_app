require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:example1)
  end
  
  test "should get show" do
    get user_path(@user)
    assert_response :success
    assert_select "title", "マイページ - カコモンバック"
  end
end
