require "test_helper"

class UnidadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unidad = unidads(:one)
  end

  test "should get index" do
    get unidads_url
    assert_response :success
  end

  test "should get new" do
    get new_unidad_url
    assert_response :success
  end

  test "should create unidad" do
    assert_difference('Unidad.count') do
      post unidads_url, params: { unidad: { nombre: @unidad.nombre } }
    end

    assert_redirected_to unidad_url(Unidad.last)
  end

  test "should show unidad" do
    get unidad_url(@unidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_unidad_url(@unidad)
    assert_response :success
  end

  test "should update unidad" do
    patch unidad_url(@unidad), params: { unidad: { nombre: @unidad.nombre } }
    assert_redirected_to unidad_url(@unidad)
  end

  test "should destroy unidad" do
    assert_difference('Unidad.count', -1) do
      delete unidad_url(@unidad)
    end

    assert_redirected_to unidads_url
  end
end
