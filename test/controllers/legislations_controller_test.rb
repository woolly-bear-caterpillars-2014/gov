require 'test_helper'

class LegislationsControllerTest < ActionController::TestCase
  setup do
    @legislation = legislations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:legislations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create legislation" do
    assert_difference('Legislation.count') do
      post :create, legislation: { abstract: @legislation.abstract, congress_voting_date: @legislation.congress_voting_date, president_signing_date: @legislation.president_signing_date, proposal_date: @legislation.proposal_date, publication_date: @legislation.publication_date, senate_voting_date: @legislation.senate_voting_date, title: @legislation.title, type: @legislation.type, url: @legislation.url }
    end

    assert_redirected_to legislation_path(assigns(:legislation))
  end

  test "should show legislation" do
    get :show, id: @legislation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @legislation
    assert_response :success
  end

  test "should update legislation" do
    patch :update, id: @legislation, legislation: { abstract: @legislation.abstract, congress_voting_date: @legislation.congress_voting_date, president_signing_date: @legislation.president_signing_date, proposal_date: @legislation.proposal_date, publication_date: @legislation.publication_date, senate_voting_date: @legislation.senate_voting_date, title: @legislation.title, type: @legislation.type, url: @legislation.url }
    assert_redirected_to legislation_path(assigns(:legislation))
  end

  test "should destroy legislation" do
    assert_difference('Legislation.count', -1) do
      delete :destroy, id: @legislation
    end

    assert_redirected_to legislations_path
  end
end
