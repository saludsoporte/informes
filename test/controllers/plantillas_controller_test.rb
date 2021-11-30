require "test_helper"

class PlantillasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plantilla = plantillas(:one)
  end

  test "should get index" do
    get plantillas_url
    assert_response :success
  end

  test "should get new" do
    get new_plantilla_url
    assert_response :success
  end

  test "should create plantilla" do
    assert_difference('Plantilla.count') do
      post plantillas_url, params: { plantilla: { dato_id: @plantilla.dato_id, herramienta_id: @plantilla.herramienta_id } }
    end

    assert_redirected_to plantilla_url(Plantilla.last)
  end

  test "should show plantilla" do
    get plantilla_url(@plantilla)
    assert_response :success
  end

  test "should get edit" do
    get edit_plantilla_url(@plantilla)
    assert_response :success
  end

  test "should update plantilla" do
    patch plantilla_url(@plantilla), params: { plantilla: { dato_id: @plantilla.dato_id, herramienta_id: @plantilla.herramienta_id } }
    assert_redirected_to plantilla_url(@plantilla)
  end

  test "should destroy plantilla" do
    assert_difference('Plantilla.count', -1) do
      delete plantilla_url(@plantilla)
    end

    assert_redirected_to plantillas_url
  end
end
