require 'test_helper'

class CountryMeasurementsControllerTest < ActionController::TestCase
  setup do
    @country_measurement = country_measurements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:country_measurements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country_measurement" do
    assert_difference('CountryMeasurement.count') do
      post :create, country_measurement: @country_measurement.attributes
    end

    assert_redirected_to country_measurement_path(assigns(:country_measurement))
  end

  test "should show country_measurement" do
    get :show, id: @country_measurement.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @country_measurement.to_param
    assert_response :success
  end

  test "should update country_measurement" do
    put :update, id: @country_measurement.to_param, country_measurement: @country_measurement.attributes
    assert_redirected_to country_measurement_path(assigns(:country_measurement))
  end

  test "should destroy country_measurement" do
    assert_difference('CountryMeasurement.count', -1) do
      delete :destroy, id: @country_measurement.to_param
    end

    assert_redirected_to country_measurements_path
  end
end
