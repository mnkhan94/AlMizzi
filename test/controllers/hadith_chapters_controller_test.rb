require 'test_helper'

class HadithChaptersControllerTest < ActionController::TestCase
  setup do
    @hadith_chapter = hadith_chapters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hadith_chapters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hadith_chapter" do
    assert_difference('HadithChapter.count') do
      post :create, hadith_chapter: {  }
    end

    assert_redirected_to hadith_chapter_path(assigns(:hadith_chapter))
  end

  test "should show hadith_chapter" do
    get :show, id: @hadith_chapter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hadith_chapter
    assert_response :success
  end

  test "should update hadith_chapter" do
    patch :update, id: @hadith_chapter, hadith_chapter: {  }
    assert_redirected_to hadith_chapter_path(assigns(:hadith_chapter))
  end

  test "should destroy hadith_chapter" do
    assert_difference('HadithChapter.count', -1) do
      delete :destroy, id: @hadith_chapter
    end

    assert_redirected_to hadith_chapters_path
  end
end
