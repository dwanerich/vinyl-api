require "test_helper"

class VinylsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vinyl = vinyls(:one)
  end

  test "should get index" do
    get vinyls_url
    assert_response :success
  end

  test "should get new" do
    get new_vinyl_url
    assert_response :success
  end

  test "should create vinyl" do
    assert_difference('Vinyl.count') do
      post vinyls_url, params: { vinyl: { artist: @vinyl.artist, genre: @vinyl.genre, title: @vinyl.title, year: @vinyl.year } }
    end

    assert_redirected_to vinyl_url(Vinyl.last)
  end

  test "should show vinyl" do
    get vinyl_url(@vinyl)
    assert_response :success
  end

  test "should get edit" do
    get edit_vinyl_url(@vinyl)
    assert_response :success
  end

  test "should update vinyl" do
    patch vinyl_url(@vinyl), params: { vinyl: { artist: @vinyl.artist, genre: @vinyl.genre, title: @vinyl.title, year: @vinyl.year } }
    assert_redirected_to vinyl_url(@vinyl)
  end

  test "should destroy vinyl" do
    assert_difference('Vinyl.count', -1) do
      delete vinyl_url(@vinyl)
    end

    assert_redirected_to vinyls_url
  end
end
