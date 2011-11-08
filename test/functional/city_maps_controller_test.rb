require 'test_helper'

class CityMapsControllerTest < ActionController::TestCase
  setup do
    @city_map = city_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:city_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create city_map" do
    assert_difference('CityMap.count') do
      post :create, city_map: @city_map.attributes
    end

    assert_redirected_to city_map_path(assigns(:city_map))
  end

  test "should show city_map" do
    get :show, id: @city_map.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @city_map.to_param
    assert_response :success
  end

  test "should update city_map" do
    put :update, id: @city_map.to_param, city_map: @city_map.attributes
    assert_redirected_to city_map_path(assigns(:city_map))
  end

  test "should destroy city_map" do
    assert_difference('CityMap.count', -1) do
      delete :destroy, id: @city_map.to_param
    end

    assert_redirected_to city_maps_path
  end
end
