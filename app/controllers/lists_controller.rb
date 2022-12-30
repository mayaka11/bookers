class ListsController < ApplicationController



  def create
    @list = Book.new(book_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
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
  end

  def update
    list = Book.find(params[:id])
    list.update(book_params)
    redirect_to list_path(list.id)
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
