class CharactersController < ApplicationController
  def index
    @characters = policy_scope(Character)
    authorize @characters
  end

  def show
    @character = policy_scope(Character).find(params[:id])
    authorize @character
  end

  def new
    @character = Character.new
    authorize @character
  end

  def create
    @character = Character.new(str_params)
    authorize @character
    @character.user = current_user
    @character.save
    if @character.save
      redirect_to character_path(@character)
    else
      render :new
    end
  end

  def destroy
    @character = policy_scope(Character).find(params[:id])
    authorize @character
    @character.destroy
    redirect_to characters_index_path
  end

  private

  def str_params
    params.require(:character).permit(:name, :price, :photo, :description)
  end
end
