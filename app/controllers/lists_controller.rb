class ListsController < ApplicationController
  def new
   @list = Book.new
  end


  def create
    @list = Book.new(book_params)
    if @list.save
      redirect_to list_path(@list.id)
      flash[:notice] = "投稿に成功しました"
    else
      render :books
    end
  end

  def index
    @list = Book.new
    @lists = Book.all

  end

  def show
    @list = Book.find(params[:id])

  end

  def edit
    @list = Book.find(params[:id])
    flash[:update] = "更新に成功しました"
  end


  def update
    @list = Book.find(params[:id])
    if @list.update
      redirect_to list_path(@list.id)
    else
      render :edit
    end
  end


  def destroy
    list = Book.find(params[:id])
    list.destroy
    redirect_to '/books'
  end




  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
