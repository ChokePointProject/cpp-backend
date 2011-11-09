require 'test_helper'

class ReasonsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Reason.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Reason.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Reason.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to reason_url(assigns(:reason))
  end

  def test_edit
    get :edit, :id => Reason.first
    assert_template 'edit'
  end

  def test_update_invalid
    Reason.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Reason.first
    assert_template 'edit'
  end

  def test_update_valid
    Reason.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Reason.first
    assert_redirected_to reason_url(assigns(:reason))
  end

  def test_destroy
    reason = Reason.first
    delete :destroy, :id => reason
    assert_redirected_to reasons_url
    assert !Reason.exists?(reason.id)
  end
end
