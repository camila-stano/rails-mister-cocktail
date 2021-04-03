class CocktailsController < ApplicationController
  
  def index
    @cocktails = Cocktail.all 
    @comments = Comment.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  def show
    set_cocktail
  end

  def edit
    set_cocktail
    
  end

  def update

  end

  def destroy
    set_cocktail
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private 

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :link_spotify)
  end
end
