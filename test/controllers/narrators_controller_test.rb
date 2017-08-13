require 'test_helper'

class NarratorsControllerTest < ActionController::TestCase
  setup do
    @narrator = narrators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:narrators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create narrator" do
    assert_difference('Narrator.count') do
      post :create, narrator: {  }
    end

    assert_redirected_to narrator_path(assigns(:narrator))
  end

  test "should show narrator" do
    get :show, id: @narrator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @narrator
    assert_response :success
  end

  test "should update narrator" do
    patch :update, id: @narrator, narrator: {  }
    assert_redirected_to narrator_path(assigns(:narrator))
  end

  test "should destroy narrator" do
    assert_difference('Narrator.count', -1) do
      delete :destroy, id: @narrator
    end

    assert_redirected_to narrators_path
  end
end
