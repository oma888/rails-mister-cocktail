class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    # @ingredient = Ingredient.find(@dose.ingredient)
    # @cocktail = Cocktail.find(@ingredient.coktail)
    @dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dose
    @dose = Dose.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
