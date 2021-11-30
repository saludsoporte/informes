require "application_system_test_case"

class ConexionBdsTest < ApplicationSystemTestCase
  setup do
    @conexion_bd = conexion_bds(:one)
  end

  test "visiting the index" do
    visit conexion_bds_url
    assert_selector "h1", text: "Conexion Bds"
  end

  test "creating a Conexion bd" do
    visit conexion_bds_url
    click_on "New Conexion Bd"

    fill_in "Nombre", with: @conexion_bd.nombre
    click_on "Create Conexion bd"

    assert_text "Conexion bd was successfully created"
    click_on "Back"
  end

  test "updating a Conexion bd" do
    visit conexion_bds_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @conexion_bd.nombre
    click_on "Update Conexion bd"

    assert_text "Conexion bd was successfully updated"
    click_on "Back"
  end

  test "destroying a Conexion bd" do
    visit conexion_bds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conexion bd was successfully destroyed"
  end
end
