require 'test_helper'

class FacturadasControllerTest < ActionController::TestCase
  setup do
    @facturada = facturadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facturadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facturada" do
    assert_difference('Facturada.count') do
      post :create, facturada: { app_id: @facturada.app_id, estatus: @facturada.estatus, factura: @facturada.factura, fecha: @facturada.fecha, importe: @facturada.importe, orden: @facturada.orden, tipo: @facturada.tipo }
    end

    assert_redirected_to facturada_path(assigns(:facturada))
  end

  test "should show facturada" do
    get :show, id: @facturada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facturada
    assert_response :success
  end

  test "should update facturada" do
    patch :update, id: @facturada, facturada: { app_id: @facturada.app_id, estatus: @facturada.estatus, factura: @facturada.factura, fecha: @facturada.fecha, importe: @facturada.importe, orden: @facturada.orden, tipo: @facturada.tipo }
    assert_redirected_to facturada_path(assigns(:facturada))
  end

  test "should destroy facturada" do
    assert_difference('Facturada.count', -1) do
      delete :destroy, id: @facturada
    end

    assert_redirected_to facturadas_path
  end
end
