require 'test_helper'

class GarantiaControllerTest < ActionController::TestCase
  setup do
    @garantium = garantia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:garantia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create garantium" do
    assert_difference('Garantium.count') do
      post :create, garantium: { date: @garantium.date, key: @garantium.key }
    end

    assert_redirected_to garantium_path(assigns(:garantium))
  end

  test "should show garantium" do
    get :show, id: @garantium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @garantium
    assert_response :success
  end

  test "should update garantium" do
    patch :update, id: @garantium, garantium: { date: @garantium.date, key: @garantium.key }
    assert_redirected_to garantium_path(assigns(:garantium))
  end

  test "should destroy garantium" do
    assert_difference('Garantium.count', -1) do
      delete :destroy, id: @garantium
    end

    assert_redirected_to garantia_path
  end
end
