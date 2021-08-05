class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      # flash[:notice] = "Book not saved!"
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end


  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :body, :confirm, :title_confirmation)
  end

end

