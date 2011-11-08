require 'test_helper'

class WorldMeasurementsControllerTest < ActionController::TestCase
  setup do
    @world_measurement = world_measurements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:world_measurements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create world_measurement" do
    assert_difference('WorldMeasurement.count') do
      post :create, world_measurement: @world_measurement.attributes
    end

    assert_redirected_to world_measurement_path(assigns(:world_measurement))
  end

  test "should show world_measurement" do
    get :show, id: @world_measurement.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @world_measurement.to_param
    assert_response :success
  end

  test "should update world_measurement" do
    put :update, id: @world_measurement.to_param, world_measurement: @world_measurement.attributes
    assert_redirected_to world_measurement_path(assigns(:world_measurement))
  end

  test "should destroy world_measurement" do
    assert_difference('WorldMeasurement.count', -1) do
      delete :destroy, id: @world_measurement.to_param
    end

    assert_redirected_to world_measurements_path
  end
end
