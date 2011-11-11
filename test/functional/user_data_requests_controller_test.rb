require 'test_helper'

class UserDataRequestsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => UserDataRequest.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    UserDataRequest.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    UserDataRequest.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_data_request_url(assigns(:user_data_request))
  end

  def test_edit
    get :edit, :id => UserDataRequest.first
    assert_template 'edit'
  end

  def test_update_invalid
    UserDataRequest.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserDataRequest.first
    assert_template 'edit'
  end

  def test_update_valid
    UserDataRequest.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserDataRequest.first
    assert_redirected_to user_data_request_url(assigns(:user_data_request))
  end

  def test_destroy
    user_data_request = UserDataRequest.first
    delete :destroy, :id => user_data_request
    assert_redirected_to user_data_requests_url
    assert !UserDataRequest.exists?(user_data_request.id)
  end
end
