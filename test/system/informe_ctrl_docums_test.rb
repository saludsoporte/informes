require "application_system_test_case"

class InformeCtrlDocumsTest < ApplicationSystemTestCase
  setup do
    @informe_ctrl_docum = informe_ctrl_docums(:one)
  end

  test "visiting the index" do
    visit informe_ctrl_docums_url
    assert_selector "h1", text: "Informe Ctrl Docums"
  end

  test "creating a Informe ctrl docum" do
    visit informe_ctrl_docums_url
    click_on "New Informe Ctrl Docum"

    fill_in "Fecha doc", with: @informe_ctrl_docum.fecha_doc
    fill_in "Herramientum", with: @informe_ctrl_docum.herramientum_id
    fill_in "Nombre informe", with: @informe_ctrl_docum.nombre_informe
    fill_in "User", with: @informe_ctrl_docum.user_id
    click_on "Create Informe ctrl docum"

    assert_text "Informe ctrl docum was successfully created"
    click_on "Back"
  end

  test "updating a Informe ctrl docum" do
    visit informe_ctrl_docums_url
    click_on "Edit", match: :first

    fill_in "Fecha doc", with: @informe_ctrl_docum.fecha_doc
    fill_in "Herramientum", with: @informe_ctrl_docum.herramientum_id
    fill_in "Nombre informe", with: @informe_ctrl_docum.nombre_informe
    fill_in "User", with: @informe_ctrl_docum.user_id
    click_on "Update Informe ctrl docum"

    assert_text "Informe ctrl docum was successfully updated"
    click_on "Back"
  end

  test "destroying a Informe ctrl docum" do
    visit informe_ctrl_docums_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Informe ctrl docum was successfully destroyed"
  end
end
