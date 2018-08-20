require "application_system_test_case"

class GamersTest < ApplicationSystemTestCase
  setup do
    @gamer = gamers(:one)
  end

  test "visiting the index" do
    visit gamers_url
    assert_selector "h1", text: "Gamers"
  end

  test "creating a Gamer" do
    visit gamers_url
    click_on "New Gamer"

    fill_in "Email", with: @gamer.email
    fill_in "Username", with: @gamer.username
    click_on "Create Gamer"

    assert_text "Gamer was successfully created"
    click_on "Back"
  end

  test "updating a Gamer" do
    visit gamers_url
    click_on "Edit", match: :first

    fill_in "Email", with: @gamer.email
    fill_in "Username", with: @gamer.username
    click_on "Update Gamer"

    assert_text "Gamer was successfully updated"
    click_on "Back"
  end

  test "destroying a Gamer" do
    visit gamers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gamer was successfully destroyed"
  end
end
