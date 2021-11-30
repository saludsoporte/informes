require "application_system_test_case"

class RelacionDatosTest < ApplicationSystemTestCase
  setup do
    @relacion_dato = relacion_datos(:one)
  end

  test "visiting the index" do
    visit relacion_datos_url
    assert_selector "h1", text: "Relacion Datos"
  end

  test "creating a Relacion dato" do
    visit relacion_datos_url
    click_on "New Relacion Dato"

    fill_in "Dato", with: @relacion_dato.dato_id
    fill_in "Herramienta", with: @relacion_dato.herramienta_id
    fill_in "Valo", with: @relacion_dato.valo
    click_on "Create Relacion dato"

    assert_text "Relacion dato was successfully created"
    click_on "Back"
  end

  test "updating a Relacion dato" do
    visit relacion_datos_url
    click_on "Edit", match: :first

    fill_in "Dato", with: @relacion_dato.dato_id
    fill_in "Herramienta", with: @relacion_dato.herramienta_id
    fill_in "Valo", with: @relacion_dato.valo
    click_on "Update Relacion dato"

    assert_text "Relacion dato was successfully updated"
    click_on "Back"
  end

  test "destroying a Relacion dato" do
    visit relacion_datos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Relacion dato was successfully destroyed"
  end
end
