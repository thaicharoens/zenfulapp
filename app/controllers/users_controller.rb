class UsersController < ApplicationController
  before_action :set_user

  def show
    @bookings = @user.bookings
    @reviews = @users.reviews
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
