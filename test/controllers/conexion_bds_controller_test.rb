require "test_helper"

class ConexionBdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conexion_bd = conexion_bds(:one)
  end

  test "should get index" do
    get conexion_bds_url
    assert_response :success
  end

  test "should get new" do
    get new_conexion_bd_url
    assert_response :success
  end

  test "should create conexion_bd" do
    assert_difference('ConexionBd.count') do
      post conexion_bds_url, params: { conexion_bd: { nombre: @conexion_bd.nombre } }
    end

    assert_redirected_to conexion_bd_url(ConexionBd.last)
  end

  test "should show conexion_bd" do
    get conexion_bd_url(@conexion_bd)
    assert_response :success
  end

  test "should get edit" do
    get edit_conexion_bd_url(@conexion_bd)
    assert_response :success
  end

  test "should update conexion_bd" do
    patch conexion_bd_url(@conexion_bd), params: { conexion_bd: { nombre: @conexion_bd.nombre } }
    assert_redirected_to conexion_bd_url(@conexion_bd)
  end

  test "should destroy conexion_bd" do
    assert_difference('ConexionBd.count', -1) do
      delete conexion_bd_url(@conexion_bd)
    end

    assert_redirected_to conexion_bds_url
  end
end
