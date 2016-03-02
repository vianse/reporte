require 'test_helper'

class SubgroupsControllerTest < ActionController::TestCase
  setup do
    @subgroup = subgroups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subgroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subgroup" do
    assert_difference('Subgroup.count') do
      post :create, subgroup: { group_id: @subgroup.group_id, name: @subgroup.name, subgroup_id: @subgroup.subgroup_id }
    end

    assert_redirected_to subgroup_path(assigns(:subgroup))
  end

  test "should show subgroup" do
    get :show, id: @subgroup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subgroup
    assert_response :success
  end

  test "should update subgroup" do
    patch :update, id: @subgroup, subgroup: { group_id: @subgroup.group_id, name: @subgroup.name, subgroup_id: @subgroup.subgroup_id }
    assert_redirected_to subgroup_path(assigns(:subgroup))
  end

  test "should destroy subgroup" do
    assert_difference('Subgroup.count', -1) do
      delete :destroy, id: @subgroup
    end

    assert_redirected_to subgroups_path
  end
end
