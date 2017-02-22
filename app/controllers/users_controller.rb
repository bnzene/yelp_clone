class UserController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to '/restaurants'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
