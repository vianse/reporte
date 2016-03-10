require 'test_helper'

class AppadminsControllerTest < ActionController::TestCase
  setup do
    @appadmin = appadmins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appadmins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appadmin" do
    assert_difference('Appadmin.count') do
      post :create, appadmin: { admin_id: @appadmin.admin_id, app_id: @appadmin.app_id, group_id: @appadmin.group_id }
    end

    assert_redirected_to appadmin_path(assigns(:appadmin))
  end

  test "should show appadmin" do
    get :show, id: @appadmin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appadmin
    assert_response :success
  end

  test "should update appadmin" do
    patch :update, id: @appadmin, appadmin: { admin_id: @appadmin.admin_id, app_id: @appadmin.app_id, group_id: @appadmin.group_id }
    assert_redirected_to appadmin_path(assigns(:appadmin))
  end

  test "should destroy appadmin" do
    assert_difference('Appadmin.count', -1) do
      delete :destroy, id: @appadmin
    end

    assert_redirected_to appadmins_path
  end
end
