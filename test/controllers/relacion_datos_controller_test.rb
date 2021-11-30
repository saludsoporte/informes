require "test_helper"

class RelacionDatosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relacion_dato = relacion_datos(:one)
  end

  test "should get index" do
    get relacion_datos_url
    assert_response :success
  end

  test "should get new" do
    get new_relacion_dato_url
    assert_response :success
  end

  test "should create relacion_dato" do
    assert_difference('RelacionDato.count') do
      post relacion_datos_url, params: { relacion_dato: { dato_id: @relacion_dato.dato_id, herramienta_id: @relacion_dato.herramienta_id, valo: @relacion_dato.valo } }
    end

    assert_redirected_to relacion_dato_url(RelacionDato.last)
  end

  test "should show relacion_dato" do
    get relacion_dato_url(@relacion_dato)
    assert_response :success
  end

  test "should get edit" do
    get edit_relacion_dato_url(@relacion_dato)
    assert_response :success
  end

  test "should update relacion_dato" do
    patch relacion_dato_url(@relacion_dato), params: { relacion_dato: { dato_id: @relacion_dato.dato_id, herramienta_id: @relacion_dato.herramienta_id, valo: @relacion_dato.valo } }
    assert_redirected_to relacion_dato_url(@relacion_dato)
  end

  test "should destroy relacion_dato" do
    assert_difference('RelacionDato.count', -1) do
      delete relacion_dato_url(@relacion_dato)
    end

    assert_redirected_to relacion_datos_url
  end
end
