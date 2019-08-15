class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(str_params)
    @character = Character.find(params[:character_id])
    authorize @character
    @booking.character = @character
    @booking.user = current_user
    if @booking.save
      redirect_to user_path(current_user)
    else
      flash[:title] = '¡Error!'
      flash[:notice] = 'You already booked this character in this date'
      redirect_to character_path(@character)
    end
  end

  def edit
  end

  def update
    @booking = Booking.find(params[:id])
    raise
    authorize @booking
    @booking.status = params[:change]
    @booking.save
    redirect_to user_path(current_user)
  end

  private

  def str_params
    params.require(:booking).permit(:location, :date, :comment)
  end
end
