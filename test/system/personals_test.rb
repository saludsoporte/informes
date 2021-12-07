require "application_system_test_case"

class PersonalsTest < ApplicationSystemTestCase
  setup do
    @personal = personals(:one)
  end

  test "visiting the index" do
    visit personals_url
    assert_selector "h1", text: "Personals"
  end

  test "creating a Personal" do
    visit personals_url
    click_on "New Personal"

    fill_in "Apellido m", with: @personal.apellido_m
    fill_in "Apellido p", with: @personal.apellido_p
    fill_in "Calle", with: @personal.calle
    fill_in "Colonia", with: @personal.colonia
    fill_in "Cp", with: @personal.cp
    fill_in "Curp", with: @personal.curp
    fill_in "Fecha nacimiento", with: @personal.fecha_nacimiento
    fill_in "Nombre", with: @personal.nombre
    fill_in "Nombre completo", with: @personal.nombre_completo
    fill_in "Numero", with: @personal.numero
    fill_in "Telefono", with: @personal.telefono
    click_on "Create Personal"

    assert_text "Personal was successfully created"
    click_on "Back"
  end

  test "updating a Personal" do
    visit personals_url
    click_on "Edit", match: :first

    fill_in "Apellido m", with: @personal.apellido_m
    fill_in "Apellido p", with: @personal.apellido_p
    fill_in "Calle", with: @personal.calle
    fill_in "Colonia", with: @personal.colonia
    fill_in "Cp", with: @personal.cp
    fill_in "Curp", with: @personal.curp
    fill_in "Fecha nacimiento", with: @personal.fecha_nacimiento
    fill_in "Nombre", with: @personal.nombre
    fill_in "Nombre completo", with: @personal.nombre_completo
    fill_in "Numero", with: @personal.numero
    fill_in "Telefono", with: @personal.telefono
    click_on "Update Personal"

    assert_text "Personal was successfully updated"
    click_on "Back"
  end

  test "destroying a Personal" do
    visit personals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personal was successfully destroyed"
  end
end
