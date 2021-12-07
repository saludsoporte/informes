require "test_helper"

class PersonalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal = personals(:one)
  end

  test "should get index" do
    get personals_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_url
    assert_response :success
  end

  test "should create personal" do
    assert_difference('Personal.count') do
      post personals_url, params: { personal: { apellido_m: @personal.apellido_m, apellido_p: @personal.apellido_p, calle: @personal.calle, colonia: @personal.colonia, cp: @personal.cp, curp: @personal.curp, fecha_nacimiento: @personal.fecha_nacimiento, nombre: @personal.nombre, nombre_completo: @personal.nombre_completo, numero: @personal.numero, telefono: @personal.telefono } }
    end

    assert_redirected_to personal_url(Personal.last)
  end

  test "should show personal" do
    get personal_url(@personal)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_url(@personal)
    assert_response :success
  end

  test "should update personal" do
    patch personal_url(@personal), params: { personal: { apellido_m: @personal.apellido_m, apellido_p: @personal.apellido_p, calle: @personal.calle, colonia: @personal.colonia, cp: @personal.cp, curp: @personal.curp, fecha_nacimiento: @personal.fecha_nacimiento, nombre: @personal.nombre, nombre_completo: @personal.nombre_completo, numero: @personal.numero, telefono: @personal.telefono } }
    assert_redirected_to personal_url(@personal)
  end

  test "should destroy personal" do
    assert_difference('Personal.count', -1) do
      delete personal_url(@personal)
    end

    assert_redirected_to personals_url
  end
end
