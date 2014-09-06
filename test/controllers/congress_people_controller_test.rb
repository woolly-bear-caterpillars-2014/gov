require 'test_helper'

class CongressPeopleControllerTest < ActionController::TestCase
  setup do
    @congress_person = congress_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:congress_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create congress_person" do
    assert_difference('CongressPerson.count') do
      post :create, congress_person: {  }
    end

    assert_redirected_to congress_person_path(assigns(:congress_person))
  end

  test "should show congress_person" do
    get :show, id: @congress_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @congress_person
    assert_response :success
  end

  test "should update congress_person" do
    patch :update, id: @congress_person, congress_person: {  }
    assert_redirected_to congress_person_path(assigns(:congress_person))
  end

  test "should destroy congress_person" do
    assert_difference('CongressPerson.count', -1) do
      delete :destroy, id: @congress_person
    end

    assert_redirected_to congress_people_path
  end
end
