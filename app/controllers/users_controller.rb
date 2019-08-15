class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @characters = @user.characters
    authorize @characters
    @bookings = Booking.all
  end
end
