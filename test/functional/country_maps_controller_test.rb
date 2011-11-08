require 'test_helper'

class CountryMapsControllerTest < ActionController::TestCase
  setup do
    @country_map = country_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:country_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country_map" do
    assert_difference('CountryMap.count') do
      post :create, country_map: @country_map.attributes
    end

    assert_redirected_to country_map_path(assigns(:country_map))
  end

  test "should show country_map" do
    get :show, id: @country_map.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @country_map.to_param
    assert_response :success
  end

  test "should update country_map" do
    put :update, id: @country_map.to_param, country_map: @country_map.attributes
    assert_redirected_to country_map_path(assigns(:country_map))
  end

  test "should destroy country_map" do
    assert_difference('CountryMap.count', -1) do
      delete :destroy, id: @country_map.to_param
    end

    assert_redirected_to country_maps_path
  end
end
