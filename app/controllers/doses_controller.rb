class DosesController < ApplicationController

  def create
    @dose = Dose.new(params.require(:dose).permit(:ingredient_id, :description))

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end
end
