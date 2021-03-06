class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :postal_code, :bio, :plant_sitter, :pick_up, :price)
  end
end
