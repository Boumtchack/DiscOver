require "test_helper"

class SongsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get songs_show_url
    assert_response :success
  end

  test "should get my_research" do
    get songs_my_research_url
    assert_response :success
  end
end
