class CharactersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(str_params)
    @character.user = User.first
    @character.save
  end

  def destroy
  end

  private

  def str_params
    params.require(:character).permit(:name, :price, :photo, :description)
  end
end
