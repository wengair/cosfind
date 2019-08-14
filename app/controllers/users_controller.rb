class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @characters = @user.characters
  end
end
