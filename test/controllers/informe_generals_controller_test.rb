require "test_helper"

class InformeGeneralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @informe_general = informe_generals(:one)
  end

  test "should get index" do
    get informe_generals_url
    assert_response :success
  end

  test "should get new" do
    get new_informe_general_url
    assert_response :success
  end

  test "should create informe_general" do
    assert_difference('InformeGeneral.count') do
      post informe_generals_url, params: { informe_general: { nombre: @informe_general.nombre } }
    end

    assert_redirected_to informe_general_url(InformeGeneral.last)
  end

  test "should show informe_general" do
    get informe_general_url(@informe_general)
    assert_response :success
  end

  test "should get edit" do
    get edit_informe_general_url(@informe_general)
    assert_response :success
  end

  test "should update informe_general" do
    patch informe_general_url(@informe_general), params: { informe_general: { nombre: @informe_general.nombre } }
    assert_redirected_to informe_general_url(@informe_general)
  end

  test "should destroy informe_general" do
    assert_difference('InformeGeneral.count', -1) do
      delete informe_general_url(@informe_general)
    end

    assert_redirected_to informe_generals_url
  end
end
