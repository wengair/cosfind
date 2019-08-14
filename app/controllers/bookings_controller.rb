class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(str_params)
    @booking.character_id = params[:character_id]
    @booking.user = current_user
    if @booking.save
      redirect_to user_path(current_user)
    else
      render characters_path(@booking.character)
    end
  end

  private

  def str_params
    params.require(:booking).permit(:location, :date)
  end
end
