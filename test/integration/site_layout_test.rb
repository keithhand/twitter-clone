require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def check_layout_links
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
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
  end
end
