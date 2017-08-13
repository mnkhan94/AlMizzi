class HadithBooksController < ApplicationController
  before_action :set_hadith_book, only: [:show, :edit, :update, :destroy]

  # GET /hadith_books
  # GET /hadith_books.json
  def index
    @hadith_books = HadithBook.all
  end

  # GET /hadith_books/1
  # GET /hadith_books/1.json
  def show
  end

  # GET /hadith_books/new
  def new
    @hadith_book = HadithBook.new
  end

  # GET /hadith_books/1/edit
  def edit
  end

  # POST /hadith_books
  # POST /hadith_books.json
  def create
    @hadith_book = HadithBook.new(hadith_book_params)

    respond_to do |format|
      if @hadith_book.save
        format.html { redirect_to @hadith_book, notice: 'Hadith book was successfully created.' }
        format.json { render :show, status: :created, location: @hadith_book }
      else
        format.html { render :new }
        format.json { render json: @hadith_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hadith_books/1
  # PATCH/PUT /hadith_books/1.json
  def update
    respond_to do |format|
      if @hadith_book.update(hadith_book_params)
        format.html { redirect_to @hadith_book, notice: 'Hadith book was successfully updated.' }
        format.json { render :show, status: :ok, location: @hadith_book }
      else
        format.html { render :edit }
        format.json { render json: @hadith_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hadith_books/1
  # DELETE /hadith_books/1.json
  def destroy
    @hadith_book.destroy
    respond_to do |format|
      format.html { redirect_to hadith_books_url, notice: 'Hadith book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hadith_book
      @hadith_book = HadithBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hadith_book_params
      params.require(:hadith_book).permit!
    end
end
