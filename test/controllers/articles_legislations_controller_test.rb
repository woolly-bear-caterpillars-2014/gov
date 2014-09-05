require 'test_helper'

class ArticlesLegislationsControllerTest < ActionController::TestCase
  setup do
    @articles_legislation = articles_legislations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles_legislations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create articles_legislation" do
    assert_difference('ArticlesLegislation.count') do
      post :create, articles_legislation: { references: @articles_legislation.references, references: @articles_legislation.references }
    end

    assert_redirected_to articles_legislation_path(assigns(:articles_legislation))
  end

  test "should show articles_legislation" do
    get :show, id: @articles_legislation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @articles_legislation
    assert_response :success
  end

  test "should update articles_legislation" do
    patch :update, id: @articles_legislation, articles_legislation: { references: @articles_legislation.references, references: @articles_legislation.references }
    assert_redirected_to articles_legislation_path(assigns(:articles_legislation))
  end

  test "should destroy articles_legislation" do
    assert_difference('ArticlesLegislation.count', -1) do
      delete :destroy, id: @articles_legislation
    end

    assert_redirected_to articles_legislations_path
  end
end
