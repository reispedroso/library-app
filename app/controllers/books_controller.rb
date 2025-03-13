class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_book, only: %i[show edit update destroy]
  before_action :set_authors, only: %i[new edit create]

  def index
    @books = Book.includes(:author).all
  end

  def show
  @books = Book.where(id: params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Book was created"
    else
      puts @book.errors.full_messages
      render :new
    end
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book was updated"
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book was deleted"
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def set_authors
    @authors = Author.all
  end

  def book_params
    params.require(:book).permit(:title, :description, :release_date, :author_id, :category_id)
  end
end
