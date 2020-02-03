require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @active_user = users(:michael)
    @non_active_user = users(:lana)
  end

  test "active users view their user page" do
    get user_path(@active_user)
    assert_template 'users/show'
    assert_select 'title', full_title(@active_user.name)
    assert_select 'h1', text: @active_user.name
  end

  test "non active user page is redirected to root url" do
    get user_path(@non_active_user)
    assert_redirected_to root_url
  end
end
