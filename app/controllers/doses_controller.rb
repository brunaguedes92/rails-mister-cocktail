class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:dose][:ingredient_id]) if params[:dose][:ingredient_id]
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @ingredients = Ingredient.all
      # @dose = Dose.new
      render :new
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktail_url, notice: 'Dose was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
