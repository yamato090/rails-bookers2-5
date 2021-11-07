class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  def follows
    user = User.find(params[:id])
    @users = user.followings
  end
  def followers
    user = User.find(params[:id])
    @users = user.followers
  end


  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully update"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  private
  def user_params
   	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
