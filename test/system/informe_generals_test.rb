require "application_system_test_case"

class InformeGeneralsTest < ApplicationSystemTestCase
  setup do
    @informe_general = informe_generals(:one)
  end

  test "visiting the index" do
    visit informe_generals_url
    assert_selector "h1", text: "Informe Generals"
  end

  test "creating a Informe general" do
    visit informe_generals_url
    click_on "New Informe General"

    fill_in "Nombre", with: @informe_general.nombre
    click_on "Create Informe general"

    assert_text "Informe general was successfully created"
    click_on "Back"
  end

  test "updating a Informe general" do
    visit informe_generals_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @informe_general.nombre
    click_on "Update Informe general"

    assert_text "Informe general was successfully updated"
    click_on "Back"
  end

  test "destroying a Informe general" do
    visit informe_generals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Informe general was successfully destroyed"
  end
end
