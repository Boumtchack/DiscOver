require "test_helper"

class PlaylistsControllerTest < ActionDispatch::IntegrationTest
  test "should get add_to_spotify" do
    get playlists_add_to_spotify_url
    assert_response :success
  end
end
