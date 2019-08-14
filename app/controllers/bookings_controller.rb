class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(str_params)
    @booking.character_id = params[:character_id]
    @booking.user = current_user
  end

  private

  def str_params
    params.require(:booking).permit(:location, :date)
  end

end