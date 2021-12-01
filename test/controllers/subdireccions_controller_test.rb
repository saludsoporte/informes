require "test_helper"

class SubdireccionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subdireccion = subdireccions(:one)
  end

  test "should get index" do
    get subdireccions_url
    assert_response :success
  end

  test "should get new" do
    get new_subdireccion_url
    assert_response :success
  end

  test "should create subdireccion" do
    assert_difference('Subdireccion.count') do
      post subdireccions_url, params: { subdireccion: { nombre: @subdireccion.nombre } }
    end

    assert_redirected_to subdireccion_url(Subdireccion.last)
  end

  test "should show subdireccion" do
    get subdireccion_url(@subdireccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_subdireccion_url(@subdireccion)
    assert_response :success
  end

  test "should update subdireccion" do
    patch subdireccion_url(@subdireccion), params: { subdireccion: { nombre: @subdireccion.nombre } }
    assert_redirected_to subdireccion_url(@subdireccion)
  end

  test "should destroy subdireccion" do
    assert_difference('Subdireccion.count', -1) do
      delete subdireccion_url(@subdireccion)
    end

    assert_redirected_to subdireccions_url
  end
end
