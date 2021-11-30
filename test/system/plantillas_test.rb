require "application_system_test_case"

class PlantillasTest < ApplicationSystemTestCase
  setup do
    @plantilla = plantillas(:one)
  end

  test "visiting the index" do
    visit plantillas_url
    assert_selector "h1", text: "Plantillas"
  end

  test "creating a Plantilla" do
    visit plantillas_url
    click_on "New Plantilla"

    fill_in "Dato", with: @plantilla.dato_id
    fill_in "Herramienta", with: @plantilla.herramienta_id
    click_on "Create Plantilla"

    assert_text "Plantilla was successfully created"
    click_on "Back"
  end

  test "updating a Plantilla" do
    visit plantillas_url
    click_on "Edit", match: :first

    fill_in "Dato", with: @plantilla.dato_id
    fill_in "Herramienta", with: @plantilla.herramienta_id
    click_on "Update Plantilla"

    assert_text "Plantilla was successfully updated"
    click_on "Back"
  end

  test "destroying a Plantilla" do
    visit plantillas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plantilla was successfully destroyed"
  end
end
