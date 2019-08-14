class UsersController < ApplicationController
  def show
    @user = current_user
    @characters = Character.all
  end
end
