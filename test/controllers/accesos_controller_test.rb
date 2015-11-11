require 'test_helper'

class AccesosControllerTest < ActionController::TestCase
  setup do
    @acceso = accesos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accesos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acceso" do
    assert_difference('Acceso.count') do
      post :create, acceso: { app_id: @acceso.app_id, user_id: @acceso.user_id }
    end

    assert_redirected_to acceso_path(assigns(:acceso))
  end

  test "should show acceso" do
    get :show, id: @acceso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acceso
    assert_response :success
  end

  test "should update acceso" do
    patch :update, id: @acceso, acceso: { app_id: @acceso.app_id, user_id: @acceso.user_id }
    assert_redirected_to acceso_path(assigns(:acceso))
  end

  test "should destroy acceso" do
    assert_difference('Acceso.count', -1) do
      delete :destroy, id: @acceso
    end

    assert_redirected_to accesos_path
  end
end
