require 'test_helper'

class ConfiguracionsControllerTest < ActionController::TestCase
  setup do
    @configuracion = configuracions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:configuracions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create configuracion" do
    assert_difference('Configuracion.count') do
      post :create, configuracion: { abiertas: @configuracion.abiertas, app_id: @configuracion.app_id, dias: @configuracion.dias, facturadas: @configuracion.facturadas, internas: @configuracion.internas }
    end

    assert_redirected_to configuracion_path(assigns(:configuracion))
  end

  test "should show configuracion" do
    get :show, id: @configuracion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @configuracion
    assert_response :success
  end

  test "should update configuracion" do
    patch :update, id: @configuracion, configuracion: { abiertas: @configuracion.abiertas, app_id: @configuracion.app_id, dias: @configuracion.dias, facturadas: @configuracion.facturadas, internas: @configuracion.internas }
    assert_redirected_to configuracion_path(assigns(:configuracion))
  end

  test "should destroy configuracion" do
    assert_difference('Configuracion.count', -1) do
      delete :destroy, id: @configuracion
    end

    assert_redirected_to configuracions_path
  end
end
