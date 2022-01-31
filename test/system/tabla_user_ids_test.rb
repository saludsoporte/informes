require "application_system_test_case"

class TablaUserIdsTest < ApplicationSystemTestCase
  setup do
    @tabla_user_id = tabla_user_ids(:one)
  end

  test "visiting the index" do
    visit tabla_user_ids_url
    assert_selector "h1", text: "Tabla User Ids"
  end

  test "creating a Tabla user" do
    visit tabla_user_ids_url
    click_on "New Tabla User"

    fill_in "Herramientum", with: @tabla_user_id.herramientum_id
    fill_in "Id user", with: @tabla_user_id.id_user
    fill_in "Nombre herramienta", with: @tabla_user_id.nombre_herramienta
    fill_in "User", with: @tabla_user_id.user_id
    click_on "Create Tabla user"

    assert_text "Tabla user was successfully created"
    click_on "Back"
  end

  test "updating a Tabla user" do
    visit tabla_user_ids_url
    click_on "Edit", match: :first

    fill_in "Herramientum", with: @tabla_user_id.herramientum_id
    fill_in "Id user", with: @tabla_user_id.id_user
    fill_in "Nombre herramienta", with: @tabla_user_id.nombre_herramienta
    fill_in "User", with: @tabla_user_id.user_id
    click_on "Update Tabla user"

    assert_text "Tabla user was successfully updated"
    click_on "Back"
  end

  test "destroying a Tabla user" do
    visit tabla_user_ids_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tabla user was successfully destroyed"
  end
end
