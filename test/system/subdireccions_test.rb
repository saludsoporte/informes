require "application_system_test_case"

class SubdireccionsTest < ApplicationSystemTestCase
  setup do
    @subdireccion = subdireccions(:one)
  end

  test "visiting the index" do
    visit subdireccions_url
    assert_selector "h1", text: "Subdireccions"
  end

  test "creating a Subdireccion" do
    visit subdireccions_url
    click_on "New Subdireccion"

    fill_in "Nombre", with: @subdireccion.nombre
    click_on "Create Subdireccion"

    assert_text "Subdireccion was successfully created"
    click_on "Back"
  end

  test "updating a Subdireccion" do
    visit subdireccions_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @subdireccion.nombre
    click_on "Update Subdireccion"

    assert_text "Subdireccion was successfully updated"
    click_on "Back"
  end

  test "destroying a Subdireccion" do
    visit subdireccions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subdireccion was successfully destroyed"
  end
end
