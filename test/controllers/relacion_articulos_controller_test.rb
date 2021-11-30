require "test_helper"

class RelacionArticulosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relacion_articulo = relacion_articulos(:one)
  end

  test "should get index" do
    get relacion_articulos_url
    assert_response :success
  end

  test "should get new" do
    get new_relacion_articulo_url
    assert_response :success
  end

  test "should create relacion_articulo" do
    assert_difference('RelacionArticulo.count') do
      post relacion_articulos_url, params: { relacion_articulo: { articulo_id: @relacion_articulo.articulo_id, herramienta_id: @relacion_articulo.herramienta_id } }
    end

    assert_redirected_to relacion_articulo_url(RelacionArticulo.last)
  end

  test "should show relacion_articulo" do
    get relacion_articulo_url(@relacion_articulo)
    assert_response :success
  end

  test "should get edit" do
    get edit_relacion_articulo_url(@relacion_articulo)
    assert_response :success
  end

  test "should update relacion_articulo" do
    patch relacion_articulo_url(@relacion_articulo), params: { relacion_articulo: { articulo_id: @relacion_articulo.articulo_id, herramienta_id: @relacion_articulo.herramienta_id } }
    assert_redirected_to relacion_articulo_url(@relacion_articulo)
  end

  test "should destroy relacion_articulo" do
    assert_difference('RelacionArticulo.count', -1) do
      delete relacion_articulo_url(@relacion_articulo)
    end

    assert_redirected_to relacion_articulos_url
  end
end
