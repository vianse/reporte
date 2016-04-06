require 'test_helper'

class CrmsControllerTest < ActionController::TestCase
  setup do
    @crm = crms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crm" do
    assert_difference('Crm.count') do
      post :create, crm: { app_id: @crm.app_id, asesor_id: @crm.asesor_id, año: @crm.año, cliente: @crm.cliente, dias: @crm.dias, fecha: @crm.fecha, fecha_salida: @crm.fecha_salida, group_id: @crm.group_id, key: @crm.key, mes: @crm.mes, sucursal_id: @crm.sucursal_id, telefono: @crm.telefono, tipo: @crm.tipo, verificacion: @crm.verificacion }
    end

    assert_redirected_to crm_path(assigns(:crm))
  end

  test "should show crm" do
    get :show, id: @crm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crm
    assert_response :success
  end

  test "should update crm" do
    patch :update, id: @crm, crm: { app_id: @crm.app_id, asesor_id: @crm.asesor_id, año: @crm.año, cliente: @crm.cliente, dias: @crm.dias, fecha: @crm.fecha, fecha_salida: @crm.fecha_salida, group_id: @crm.group_id, key: @crm.key, mes: @crm.mes, sucursal_id: @crm.sucursal_id, telefono: @crm.telefono, tipo: @crm.tipo, verificacion: @crm.verificacion }
    assert_redirected_to crm_path(assigns(:crm))
  end

  test "should destroy crm" do
    assert_difference('Crm.count', -1) do
      delete :destroy, id: @crm
    end

    assert_redirected_to crms_path
  end
end
