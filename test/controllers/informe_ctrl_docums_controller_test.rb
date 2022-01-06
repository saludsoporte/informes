require "test_helper"

class InformeCtrlDocumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @informe_ctrl_docum = informe_ctrl_docums(:one)
  end

  test "should get index" do
    get informe_ctrl_docums_url
    assert_response :success
  end

  test "should get new" do
    get new_informe_ctrl_docum_url
    assert_response :success
  end

  test "should create informe_ctrl_docum" do
    assert_difference('InformeCtrlDocum.count') do
      post informe_ctrl_docums_url, params: { informe_ctrl_docum: { fecha_doc: @informe_ctrl_docum.fecha_doc, herramientum_id: @informe_ctrl_docum.herramientum_id, nombre_informe: @informe_ctrl_docum.nombre_informe, user_id: @informe_ctrl_docum.user_id } }
    end

    assert_redirected_to informe_ctrl_docum_url(InformeCtrlDocum.last)
  end

  test "should show informe_ctrl_docum" do
    get informe_ctrl_docum_url(@informe_ctrl_docum)
    assert_response :success
  end

  test "should get edit" do
    get edit_informe_ctrl_docum_url(@informe_ctrl_docum)
    assert_response :success
  end

  test "should update informe_ctrl_docum" do
    patch informe_ctrl_docum_url(@informe_ctrl_docum), params: { informe_ctrl_docum: { fecha_doc: @informe_ctrl_docum.fecha_doc, herramientum_id: @informe_ctrl_docum.herramientum_id, nombre_informe: @informe_ctrl_docum.nombre_informe, user_id: @informe_ctrl_docum.user_id } }
    assert_redirected_to informe_ctrl_docum_url(@informe_ctrl_docum)
  end

  test "should destroy informe_ctrl_docum" do
    assert_difference('InformeCtrlDocum.count', -1) do
      delete informe_ctrl_docum_url(@informe_ctrl_docum)
    end

    assert_redirected_to informe_ctrl_docums_url
  end
end
