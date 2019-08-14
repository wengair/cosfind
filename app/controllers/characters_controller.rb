class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(str_params)
    @character.user = current_user
    @character.save
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
  end

  private

  def str_params
    params.require(:character).permit(:name, :price, :photo, :description)
  end
end
