require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "profile display" do
    log_in_as(@user)
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'div[id=follow_form]', count: 0
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'div.pagination'
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end

  test "profile display for unfollowed user" do
    log_in_as(@user)
    @user.unfollow(@other_user)
    get user_path(@other_user)
    assert_select 'div[id=follow_form]>form>input[type=submit][value=?]', "Follow"
  end

  test "profile display for followed user" do
    log_in_as(@user)
    @user.follow(@other_user)
    get user_path(@other_user)
    assert_select 'div[id=follow_form]>form>input[type=submit][value=?]', "Unfollow"
  end
end
