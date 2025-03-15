class RentalsController < ApplicationController\
  # before_action :set_rental, only: %i[show edit update destroy]
  # before_action :set_users_and_books, only: %i[new edit]
  before_action :set_book, only: [ :new, :create ]

  def index
    @books = Book.where(is_rented: false)
  end

  def show; end

  def new
    @rental = Rental.new
  end

  def create
   @rental = Rental.new(rental_params)
   @rental.user = current_user
   @rental.book = @book

   if @rental.save
     redirect_to rentals_path, notice: "Book rented sucessfully"
   else
    render :new
   end
  end

  def edit; end

  def update
    @rental.update(rental_params)
    if @rental.save
      redirect_to @rental, notice: "Rental successfully updated."
    else
      set_users_and_books
      render :edit
    end
  end

  def destroy
    @rental.destroy
    redirect_to rentals_path, notice: "Rental successfully removed."
  end

  private

  # def set_rental
  #   @rental = Rental.find(params[:id])
  # end

  # def set_users_and_books
  #   @users = User.all
  #   @books = Book.all
  # end

  def set_book
    puts "Book ID: #{params[:book_id]}"
    @book = Book.friendly.find(params[:book_id])
  end

  def rental_params
    params.require(:rental).permit(:book_id, :user_id)
  end
end
