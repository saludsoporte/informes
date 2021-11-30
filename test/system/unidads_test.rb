require "application_system_test_case"

class UnidadsTest < ApplicationSystemTestCase
  setup do
    @unidad = unidads(:one)
  end

  test "visiting the index" do
    visit unidads_url
    assert_selector "h1", text: "Unidads"
  end

  test "creating a Unidad" do
    visit unidads_url
    click_on "New Unidad"

    fill_in "Nombre", with: @unidad.nombre
    click_on "Create Unidad"

    assert_text "Unidad was successfully created"
    click_on "Back"
  end

  test "updating a Unidad" do
    visit unidads_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @unidad.nombre
    click_on "Update Unidad"

    assert_text "Unidad was successfully updated"
    click_on "Back"
  end

  test "destroying a Unidad" do
    visit unidads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Unidad was successfully destroyed"
  end
end
