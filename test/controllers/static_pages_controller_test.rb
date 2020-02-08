require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | Hello App"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | Hello App"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | Hello App"
  end
  

end
