require 'test_helper'

class HadithCollectionsControllerTest < ActionController::TestCase
  setup do
    @hadith_collection = hadith_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hadith_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hadith_collection" do
    assert_difference('HadithCollection.count') do
      post :create, hadith_collection: {  }
    end

    assert_redirected_to hadith_collection_path(assigns(:hadith_collection))
  end

  test "should show hadith_collection" do
    get :show, id: @hadith_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hadith_collection
    assert_response :success
  end

  test "should update hadith_collection" do
    patch :update, id: @hadith_collection, hadith_collection: {  }
    assert_redirected_to hadith_collection_path(assigns(:hadith_collection))
  end

  test "should destroy hadith_collection" do
    assert_difference('HadithCollection.count', -1) do
      delete :destroy, id: @hadith_collection
    end

    assert_redirected_to hadith_collections_path
  end
end
