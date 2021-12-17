require "application_system_test_case"

class RelacionEntradaUnidadsTest < ApplicationSystemTestCase
  setup do
    @relacion_entrada_unidad = relacion_entrada_unidads(:one)
  end

  test "visiting the index" do
    visit relacion_entrada_unidads_url
    assert_selector "h1", text: "Relacion Entrada Unidads"
  end

  test "creating a Relacion entrada unidad" do
    visit relacion_entrada_unidads_url
    click_on "New Relacion Entrada Unidad"

    fill_in "Buen estado", with: @relacion_entrada_unidad.buen_estado
    fill_in "Caducado", with: @relacion_entrada_unidad.caducado
    fill_in "Existencia fisica", with: @relacion_entrada_unidad.existencia_fisica
    fill_in "Extra", with: @relacion_entrada_unidad.extra
    fill_in "Informe general", with: @relacion_entrada_unidad.informe_general_id
    fill_in "Necesita", with: @relacion_entrada_unidad.necesita
    fill_in "Por caducar", with: @relacion_entrada_unidad.por_caducar
    fill_in "Unidad", with: @relacion_entrada_unidad.unidad_id
    click_on "Create Relacion entrada unidad"

    assert_text "Relacion entrada unidad was successfully created"
    click_on "Back"
  end

  test "updating a Relacion entrada unidad" do
    visit relacion_entrada_unidads_url
    click_on "Edit", match: :first

    fill_in "Buen estado", with: @relacion_entrada_unidad.buen_estado
    fill_in "Caducado", with: @relacion_entrada_unidad.caducado
    fill_in "Existencia fisica", with: @relacion_entrada_unidad.existencia_fisica
    fill_in "Extra", with: @relacion_entrada_unidad.extra
    fill_in "Informe general", with: @relacion_entrada_unidad.informe_general_id
    fill_in "Necesita", with: @relacion_entrada_unidad.necesita
    fill_in "Por caducar", with: @relacion_entrada_unidad.por_caducar
    fill_in "Unidad", with: @relacion_entrada_unidad.unidad_id
    click_on "Update Relacion entrada unidad"

    assert_text "Relacion entrada unidad was successfully updated"
    click_on "Back"
  end

  test "destroying a Relacion entrada unidad" do
    visit relacion_entrada_unidads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Relacion entrada unidad was successfully destroyed"
  end
end
