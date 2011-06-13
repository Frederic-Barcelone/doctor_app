require 'test_helper'

class MedsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Med.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Med.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Med.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to med_url(assigns(:med))
  end

  def test_edit
    get :edit, :id => Med.first
    assert_template 'edit'
  end

  def test_update_invalid
    Med.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Med.first
    assert_template 'edit'
  end

  def test_update_valid
    Med.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Med.first
    assert_redirected_to med_url(assigns(:med))
  end

  def test_destroy
    med = Med.first
    delete :destroy, :id => med
    assert_redirected_to meds_url
    assert !Med.exists?(med.id)
  end
end
