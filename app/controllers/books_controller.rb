class BooksController < ApplicationController

  def index
    @books=Book.all
    p "標準出力にのみ反映"
    logger.debug("標準出力とログファイルに記録される")
  end

  def show
    @book=Book.find(params[:id])
  end

  def create
    books=Book.index(book_params)
    books.save
    redirect_to book_path(books.id)
  end

  def edit
  end

 private
  def book_params
   params.require(:books).permit(:title,:body)
  end
end
