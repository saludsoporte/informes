require "test_helper"

class TablaUserIdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tabla_user_id = tabla_user_ids(:one)
  end

  test "should get index" do
    get tabla_user_ids_url
    assert_response :success
  end

  test "should get new" do
    get new_tabla_user_id_url
    assert_response :success
  end

  test "should create tabla_user_id" do
    assert_difference('TablaUserId.count') do
      post tabla_user_ids_url, params: { tabla_user_id: { herramientum_id: @tabla_user_id.herramientum_id, id_user: @tabla_user_id.id_user, nombre_herramienta: @tabla_user_id.nombre_herramienta, user_id: @tabla_user_id.user_id } }
    end

    assert_redirected_to tabla_user_id_url(TablaUserId.last)
  end

  test "should show tabla_user_id" do
    get tabla_user_id_url(@tabla_user_id)
    assert_response :success
  end

  test "should get edit" do
    get edit_tabla_user_id_url(@tabla_user_id)
    assert_response :success
  end

  test "should update tabla_user_id" do
    patch tabla_user_id_url(@tabla_user_id), params: { tabla_user_id: { herramientum_id: @tabla_user_id.herramientum_id, id_user: @tabla_user_id.id_user, nombre_herramienta: @tabla_user_id.nombre_herramienta, user_id: @tabla_user_id.user_id } }
    assert_redirected_to tabla_user_id_url(@tabla_user_id)
  end

  test "should destroy tabla_user_id" do
    assert_difference('TablaUserId.count', -1) do
      delete tabla_user_id_url(@tabla_user_id)
    end

    assert_redirected_to tabla_user_ids_url
  end
end
