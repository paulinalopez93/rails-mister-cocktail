class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save!
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to dose_path(@dose.id)
  end

  private

  def dose_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

# class DosesController < ApplicationController

#   def create
#     @dose = Dose.new(params.require(:dose).permit(:ingredient_id, :description))

#     @cocktail = Cocktail.find(params[:cocktail_id])
#     @dose.cocktail = @cocktail
#     if @dose.save
#       redirect_to cocktail_path(@cocktail)
#     elsif
#       render "cocktails/show"
#     end
#   end


# end
