class BooksController < ApplicationController

  def index
    @books=Book.all
    p "標準出力にのみ反映"
    logger.debug("標準出力とログファイルに記録される")
    @book=Book.new 
    @books=Book.all.order(updated_at: :asc)
    
  end

  def create
    @books=Book.all
    @book=Book.new (book_params)
    if @book.save
      flash[:notice]="Book was successfully created."
       redirect_to book_path(@book.id)
    else
      render :index
    end   
    
  end

  def show
    @book=Book.find(params[:id])
  end
  
  def edit
    @book=Book.find(params[:id])
  end
  
  def update
    @book=Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice]="Book was successfully created."
       redirect_to book_path(@book.id)
    else
      render :edit
       
    end   
  
  end  

  def destroy
     @book=Book.find(params[:id])
     if @book.destroy
     flash[:notice]="Book was successfully destroyed."
     redirect_to books_path 
     else
     render :index 
     end
  end
  
 private
  def book_params
   params.require(:book).permit(:title,:body)
  end
end
