require 'test_helper'

class CityMeasurementsControllerTest < ActionController::TestCase
  setup do
    @city_measurement = city_measurements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:city_measurements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create city_measurement" do
    assert_difference('CityMeasurement.count') do
      post :create, city_measurement: @city_measurement.attributes
    end

    assert_redirected_to city_measurement_path(assigns(:city_measurement))
  end

  test "should show city_measurement" do
    get :show, id: @city_measurement.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @city_measurement.to_param
    assert_response :success
  end

  test "should update city_measurement" do
    put :update, id: @city_measurement.to_param, city_measurement: @city_measurement.attributes
    assert_redirected_to city_measurement_path(assigns(:city_measurement))
  end

  test "should destroy city_measurement" do
    assert_difference('CityMeasurement.count', -1) do
      delete :destroy, id: @city_measurement.to_param
    end

    assert_redirected_to city_measurements_path
  end
end
