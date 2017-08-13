require 'test_helper'

class HadithBooksControllerTest < ActionController::TestCase
  setup do
    @hadith_book = hadith_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hadith_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hadith_book" do
    assert_difference('HadithBook.count') do
      post :create, hadith_book: {  }
    end

    assert_redirected_to hadith_book_path(assigns(:hadith_book))
  end

  test "should show hadith_book" do
    get :show, id: @hadith_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hadith_book
    assert_response :success
  end

  test "should update hadith_book" do
    patch :update, id: @hadith_book, hadith_book: {  }
    assert_redirected_to hadith_book_path(assigns(:hadith_book))
  end

  test "should destroy hadith_book" do
    assert_difference('HadithBook.count', -1) do
      delete :destroy, id: @hadith_book
    end

    assert_redirected_to hadith_books_path
  end
end
