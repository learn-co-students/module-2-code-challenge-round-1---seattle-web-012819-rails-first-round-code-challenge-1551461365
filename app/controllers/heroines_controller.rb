class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    # @search = Power.find_by(power_name = :q)
  end

  def show 
    @heroine = Heroine.find(params[:id])
  end 

  def new 
    @heroine = Heroine.new
    @powers = Power.all
  end 

  def create 
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
    redirect_to heroine_path(@heroine)
    else 
      flash[:errors]
      redirect_to new_heroine_path
    end
  end 

  private 

  def heroine_params 
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end 

end
