require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  def check_layout_links
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    if is_logged_in?
      assert_select "a[href=?]", users_path
      assert_select "a[href=?]", user_path(@user)
      assert_select "a[href=?]", edit_user_path(@user)
    else
      assert_select "a[href=?]", login_path
    end
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "title", full_title
    check_layout_links

    get contact_path
    assert_template 'static_pages/contact'
    assert_select "title", full_title("Contact")
    check_layout_links

    get help_path
    assert_template 'static_pages/help'
    assert_select "title", full_title("Help")
    check_layout_links

    get about_path
    assert_template 'static_pages/about'
    assert_select "title", full_title("About")
    check_layout_links

    get signup_path
    assert_template 'users/new'
    assert_select "title", full_title("Sign up")
    check_layout_links

    get login_path
    assert_template 'sessions/new'
    assert_select "title", full_title("Log in")
    check_layout_links

    log_in_as @user
    get users_path
    assert_template 'users/index'
    assert_select "title", full_title("All users")
    check_layout_links

    get user_path(@user)
    assert_template 'users/show'
    assert_select "title", full_title(@user.name)
    check_layout_links

    get edit_user_path(@user)
    assert_template 'users/edit'
    assert_select "title", full_title("Edit user")
    check_layout_links
  end
end
