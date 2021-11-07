class BooksController < ApplicationController
    def show
       @book = Book.find(params[:id])
       @books = Book.all
       @user = @book.user
       @new_book = Book.new
       @book_comment = BookComment.new
    end
    def index
       @user = current_user
       @book = Book.new
       @books = Book.all
       @book_comment = BookComment.new
    end
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
           flash[:notice] = "successfully created"
           redirect_to book_path(@book)
        else
           @user = current_user
           @books = Book.all
           render :index
        end
    end
    def edit
       @book = Book.find(params[:id])
       if @book.user != current_user
        redirect_to books_path
       end
    end
    def update
        @book = Book.find(params[:id])
        @book.user_id = current_user.id
        if @book.update(book_params)
          flash[:notice] = "successfully update"
          redirect_to book_path(@book.id)
        else
        @books = Book.all
        render :edit
        end
    end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:notice] = "successfully destroy"
        redirect_to books_path
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
