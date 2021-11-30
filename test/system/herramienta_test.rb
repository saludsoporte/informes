require "application_system_test_case"

class HerramientaTest < ApplicationSystemTestCase
  setup do
    @herramientum = herramienta(:one)
  end

  test "visiting the index" do
    visit herramienta_url
    assert_selector "h1", text: "Herramienta"
  end

  test "creating a Herramientum" do
    visit herramienta_url
    click_on "New Herramientum"

    fill_in "Conexion bd", with: @herramientum.conexion_bd_id
    fill_in "Dato", with: @herramientum.dato_id
    click_on "Create Herramientum"

    assert_text "Herramientum was successfully created"
    click_on "Back"
  end

  test "updating a Herramientum" do
    visit herramienta_url
    click_on "Edit", match: :first

    fill_in "Conexion bd", with: @herramientum.conexion_bd_id
    fill_in "Dato", with: @herramientum.dato_id
    click_on "Update Herramientum"

    assert_text "Herramientum was successfully updated"
    click_on "Back"
  end

  test "destroying a Herramientum" do
    visit herramienta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Herramientum was successfully destroyed"
  end
end
