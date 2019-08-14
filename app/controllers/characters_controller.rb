class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
    @booking = Booking.new
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(str_params)
    @character.user = current_user
    @character.save
    if @character.save
      redirect_to character_path(@character)
    else
      render :new
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to characters_index_path
  end

  private

  def str_params
    params.require(:character).permit(:name, :price, :photo, :description)
  end
end
