require "test_helper"

class RelacionEntradaUnidadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relacion_entrada_unidad = relacion_entrada_unidads(:one)
  end

  test "should get index" do
    get relacion_entrada_unidads_url
    assert_response :success
  end

  test "should get new" do
    get new_relacion_entrada_unidad_url
    assert_response :success
  end

  test "should create relacion_entrada_unidad" do
    assert_difference('RelacionEntradaUnidad.count') do
      post relacion_entrada_unidads_url, params: { relacion_entrada_unidad: { buen_estado: @relacion_entrada_unidad.buen_estado, caducado: @relacion_entrada_unidad.caducado, existencia_fisica: @relacion_entrada_unidad.existencia_fisica, extra: @relacion_entrada_unidad.extra, informe_general_id: @relacion_entrada_unidad.informe_general_id, necesita: @relacion_entrada_unidad.necesita, por_caducar: @relacion_entrada_unidad.por_caducar, unidad_id: @relacion_entrada_unidad.unidad_id } }
    end

    assert_redirected_to relacion_entrada_unidad_url(RelacionEntradaUnidad.last)
  end

  test "should show relacion_entrada_unidad" do
    get relacion_entrada_unidad_url(@relacion_entrada_unidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_relacion_entrada_unidad_url(@relacion_entrada_unidad)
    assert_response :success
  end

  test "should update relacion_entrada_unidad" do
    patch relacion_entrada_unidad_url(@relacion_entrada_unidad), params: { relacion_entrada_unidad: { buen_estado: @relacion_entrada_unidad.buen_estado, caducado: @relacion_entrada_unidad.caducado, existencia_fisica: @relacion_entrada_unidad.existencia_fisica, extra: @relacion_entrada_unidad.extra, informe_general_id: @relacion_entrada_unidad.informe_general_id, necesita: @relacion_entrada_unidad.necesita, por_caducar: @relacion_entrada_unidad.por_caducar, unidad_id: @relacion_entrada_unidad.unidad_id } }
    assert_redirected_to relacion_entrada_unidad_url(@relacion_entrada_unidad)
  end

  test "should destroy relacion_entrada_unidad" do
    assert_difference('RelacionEntradaUnidad.count', -1) do
      delete relacion_entrada_unidad_url(@relacion_entrada_unidad)
    end

    assert_redirected_to relacion_entrada_unidads_url
  end
end
