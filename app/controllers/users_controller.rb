class UsersController < ApplicationController
  def index
    # different for plant_sitters and customers
    # we need to install devise, so we can use
    # "current_user.plant_sitter == true" condition
    # until logging is implemented, we are using User.all
    @users = User.all
  end

  def new
    @user = User.new
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
