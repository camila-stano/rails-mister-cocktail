class DosesController < ApplicationController
  # before_action :find_cocktail, only: %i[new create]
  before_action :find, only: %i[destroy]
  
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_doses_path(@dose.cocktail)
  end

  private

  def find
    @dose = Dose.find(params[:id])
  end

  # def find_cocktail
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  # end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
