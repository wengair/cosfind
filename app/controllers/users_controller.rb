class UsersController < ApplicationController
  def show
    @status = { pending: 'pending',
                accept: 'accept',
                deny: 'deny',
                cancel: 'cancel' }
    @user = User.find(params[:id])
    authorize @user
    @characters = @user.characters
    authorize @characters
    if current_user.admin
      @bookings = Booking.all
    else
      sql_query = " \
      bookings.user_id = :user\
      OR characters.user_id = :user"
      @bookings = Booking.joins(:character).where(sql_query, user: current_user).order('id DESC')
    end
  end
end
