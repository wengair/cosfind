class CharactersController < ApplicationController
  def index
    if params[:query] && params[:query] != ""
      sql_query = " \
        characters.name ILIKE :query \
        OR characters.description ILIKE :query \
        OR users.name ILIKE :query \
      "
      search_card = policy_scope(Character).joins(:user).where(sql_query, query: "%#{params[:query]}%")
      search_tags = policy_scope(Character).tagged_with(params[:query].split, any: true)
      @characters = search_card + search_tags
    else
      @characters = policy_scope(Character).order('id DESC')
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
