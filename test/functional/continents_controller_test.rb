require 'test_helper'

class ContinentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Continent.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Continent.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Continent.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to continent_url(assigns(:continent))
  end

  def test_edit
    get :edit, :id => Continent.first
    assert_template 'edit'
  end

  def test_update_invalid
    Continent.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Continent.first
    assert_template 'edit'
  end

  def test_update_valid
    Continent.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Continent.first
    assert_redirected_to continent_url(assigns(:continent))
  end

  def test_destroy
    continent = Continent.first
    delete :destroy, :id => continent
    assert_redirected_to continents_url
    assert !Continent.exists?(continent.id)
  end
end
