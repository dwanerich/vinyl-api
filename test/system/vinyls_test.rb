require "application_system_test_case"

class VinylsTest < ApplicationSystemTestCase
  setup do
    @vinyl = vinyls(:one)
  end

  test "visiting the index" do
    visit vinyls_url
    assert_selector "h1", text: "Vinyls"
  end

  test "creating a Vinyl" do
    visit vinyls_url
    click_on "New Vinyl"

    fill_in "Artist", with: @vinyl.artist
    fill_in "Genre", with: @vinyl.genre
    fill_in "Title", with: @vinyl.title
    fill_in "Year", with: @vinyl.year
    click_on "Create Vinyl"

    assert_text "Vinyl was successfully created"
    click_on "Back"
  end

  test "updating a Vinyl" do
    visit vinyls_url
    click_on "Edit", match: :first

    fill_in "Artist", with: @vinyl.artist
    fill_in "Genre", with: @vinyl.genre
    fill_in "Title", with: @vinyl.title
    fill_in "Year", with: @vinyl.year
    click_on "Update Vinyl"

    assert_text "Vinyl was successfully updated"
    click_on "Back"
  end

  test "destroying a Vinyl" do
    visit vinyls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vinyl was successfully destroyed"
  end
end
