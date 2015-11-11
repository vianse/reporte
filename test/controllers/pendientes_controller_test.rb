require 'test_helper'

class PendientesControllerTest < ActionController::TestCase
  setup do
    @pendiente = pendientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pendientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pendiente" do
    assert_difference('Pendiente.count') do
      post :create, pendiente: { app_id: @pendiente.app_id, estatus: @pendiente.estatus, fecha: @pendiente.fecha, importe: @pendiente.importe, orden: @pendiente.orden, tipo: @pendiente.tipo }
    end

    assert_redirected_to pendiente_path(assigns(:pendiente))
  end

  test "should show pendiente" do
    get :show, id: @pendiente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pendiente
    assert_response :success
  end

  test "should update pendiente" do
    patch :update, id: @pendiente, pendiente: { app_id: @pendiente.app_id, estatus: @pendiente.estatus, fecha: @pendiente.fecha, importe: @pendiente.importe, orden: @pendiente.orden, tipo: @pendiente.tipo }
    assert_redirected_to pendiente_path(assigns(:pendiente))
  end

  test "should destroy pendiente" do
    assert_difference('Pendiente.count', -1) do
      delete :destroy, id: @pendiente
    end

    assert_redirected_to pendientes_path
  end
end
