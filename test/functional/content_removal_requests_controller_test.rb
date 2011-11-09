require 'test_helper'

class ContentRemovalRequestsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ContentRemovalRequest.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ContentRemovalRequest.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ContentRemovalRequest.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to content_removal_request_url(assigns(:content_removal_request))
  end

  def test_edit
    get :edit, :id => ContentRemovalRequest.first
    assert_template 'edit'
  end

  def test_update_invalid
    ContentRemovalRequest.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ContentRemovalRequest.first
    assert_template 'edit'
  end

  def test_update_valid
    ContentRemovalRequest.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ContentRemovalRequest.first
    assert_redirected_to content_removal_request_url(assigns(:content_removal_request))
  end

  def test_destroy
    content_removal_request = ContentRemovalRequest.first
    delete :destroy, :id => content_removal_request
    assert_redirected_to content_removal_requests_url
    assert !ContentRemovalRequest.exists?(content_removal_request.id)
  end
end
