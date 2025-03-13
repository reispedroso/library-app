class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  def index
    @authors = Author.all
  end

  def show; end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author, notice: "Author was created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @author.update(author_params)
      redirect_to @author, notice: "Author was updated"
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path, notice: "Author was deleted"
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
