require "application_system_test_case"

class RelacionHerramientaTest < ApplicationSystemTestCase
  setup do
    @relacion_herramientum = relacion_herramienta(:one)
  end

  test "visiting the index" do
    visit relacion_herramienta_url
    assert_selector "h1", text: "Relacion Herramienta"
  end

  test "creating a Relacion herramientum" do
    visit relacion_herramienta_url
    click_on "New Relacion Herramientum"

    fill_in "Herramienta", with: @relacion_herramientum.herramienta_id
    fill_in "Informe general", with: @relacion_herramientum.informe_general_id
    click_on "Create Relacion herramientum"

    assert_text "Relacion herramientum was successfully created"
    click_on "Back"
  end

  test "updating a Relacion herramientum" do
    visit relacion_herramienta_url
    click_on "Edit", match: :first

    fill_in "Herramienta", with: @relacion_herramientum.herramienta_id
    fill_in "Informe general", with: @relacion_herramientum.informe_general_id
    click_on "Update Relacion herramientum"

    assert_text "Relacion herramientum was successfully updated"
    click_on "Back"
  end

  test "destroying a Relacion herramientum" do
    visit relacion_herramienta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Relacion herramientum was successfully destroyed"
  end
end
