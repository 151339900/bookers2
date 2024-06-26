class UsersController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @books = Book.all
    if @book.save
      redirect_to book_path(book.id)
    else
      render :index
    end
  end

  def new
    @post_image = current_user.id
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.new
    @users = User.all
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
    redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(@user.id)
   else
     render :edit
   end
  end
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
