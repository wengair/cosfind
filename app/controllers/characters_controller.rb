class CharactersController < ApplicationController
  def index
    if @characters.nil?
      @characters = policy_scope(Character)
    end
  end

  def show
    @character = Character.find(params[:id])
    @booking = Booking.new
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
    @character = Character.find(params[:id])
    authorize @character
    @character.destroy
    redirect_to characters_path
  end

  def tagged
    if params[:tag][:tag_list].present?
      @characters = Character.tagged_with(params[:tag][:tag_list])
    else
      @characters = Character.all
    end
    authorize @characters
  end

  private

  def str_params
    params.require(:character).permit(:name, :price, :photo, :description)#, :tag)
  end
end
