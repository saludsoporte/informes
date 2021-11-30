require "application_system_test_case"

class RelacionArticulosTest < ApplicationSystemTestCase
  setup do
    @relacion_articulo = relacion_articulos(:one)
  end

  test "visiting the index" do
    visit relacion_articulos_url
    assert_selector "h1", text: "Relacion Articulos"
  end

  test "creating a Relacion articulo" do
    visit relacion_articulos_url
    click_on "New Relacion Articulo"

    fill_in "Articulo", with: @relacion_articulo.articulo_id
    fill_in "Herramienta", with: @relacion_articulo.herramienta_id
    click_on "Create Relacion articulo"

    assert_text "Relacion articulo was successfully created"
    click_on "Back"
  end

  test "updating a Relacion articulo" do
    visit relacion_articulos_url
    click_on "Edit", match: :first

    fill_in "Articulo", with: @relacion_articulo.articulo_id
    fill_in "Herramienta", with: @relacion_articulo.herramienta_id
    click_on "Update Relacion articulo"

    assert_text "Relacion articulo was successfully updated"
    click_on "Back"
  end

  test "destroying a Relacion articulo" do
    visit relacion_articulos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Relacion articulo was successfully destroyed"
  end
end
