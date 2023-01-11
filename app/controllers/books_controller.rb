class BooksController < ApplicationController
  def new
   @book = Book.new
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "投稿に成功しました"
    else
      @books = Book.all
      render :index

    end
  end

  def index
    @book = Book.new
    @books = Book.all

  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])

  end


  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    flash[:update] = "更新に成功しました"
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
    flash[:destroy] = "削除が成功しました"
  end




  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

