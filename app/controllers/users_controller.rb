class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_parmas)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

  end
  def update
    @user = User.find(params[:id])
     if @user.update(user_parmas)
        redirect_to root_path
     else
        render :edit
     end    
  end
  def destroy
    @user = User.find(user_parmas)
    if @user.destroy
      redirect_to root_path
    end
  end

  private
  def user_parmas
    params.require(:user).permit(:name,:phone,:email)
  end
end
