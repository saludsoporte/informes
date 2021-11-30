require "test_helper"

class RelacionHerramientaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @relacion_herramientum = relacion_herramienta(:one)
  end

  test "should get index" do
    get relacion_herramienta_url
    assert_response :success
  end

  test "should get new" do
    get new_relacion_herramientum_url
    assert_response :success
  end

  test "should create relacion_herramientum" do
    assert_difference('RelacionHerramientum.count') do
      post relacion_herramienta_url, params: { relacion_herramientum: { herramienta_id: @relacion_herramientum.herramienta_id, informe_general_id: @relacion_herramientum.informe_general_id } }
    end

    assert_redirected_to relacion_herramientum_url(RelacionHerramientum.last)
  end

  test "should show relacion_herramientum" do
    get relacion_herramientum_url(@relacion_herramientum)
    assert_response :success
  end

  test "should get edit" do
    get edit_relacion_herramientum_url(@relacion_herramientum)
    assert_response :success
  end

  test "should update relacion_herramientum" do
    patch relacion_herramientum_url(@relacion_herramientum), params: { relacion_herramientum: { herramienta_id: @relacion_herramientum.herramienta_id, informe_general_id: @relacion_herramientum.informe_general_id } }
    assert_redirected_to relacion_herramientum_url(@relacion_herramientum)
  end

  test "should destroy relacion_herramientum" do
    assert_difference('RelacionHerramientum.count', -1) do
      delete relacion_herramientum_url(@relacion_herramientum)
    end

    assert_redirected_to relacion_herramienta_url
  end
end
