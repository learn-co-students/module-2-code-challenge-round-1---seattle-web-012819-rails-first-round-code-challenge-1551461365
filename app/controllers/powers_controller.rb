class PowersController < ApplicationController

  before_action :set_power, only: [:show]

  def index
    @powers = Power.all
  end

  def show 
  end 

  
  private 
  
  def set_power
    @power = Power.find(params[:id])
  end
  
  def power_params 
    #params.require(:power).permit(:name, :id)
    #probably won't be needed
  end
  
end