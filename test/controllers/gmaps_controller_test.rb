require 'test_helper'

class GmapsControllerTest < ActionController::TestCase
  setup do
    @gmap = gmaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gmaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gmap" do
    assert_difference('Gmap.count') do
      post :create, gmap: {  }
    end

    assert_redirected_to gmap_path(assigns(:gmap))
  end

  test "should show gmap" do
    get :show, id: @gmap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gmap
    assert_response :success
  end

  test "should update gmap" do
    patch :update, id: @gmap, gmap: {  }
    assert_redirected_to gmap_path(assigns(:gmap))
  end

  test "should destroy gmap" do
    assert_difference('Gmap.count', -1) do
      delete :destroy, id: @gmap
    end

    assert_redirected_to gmaps_path
  end
end
