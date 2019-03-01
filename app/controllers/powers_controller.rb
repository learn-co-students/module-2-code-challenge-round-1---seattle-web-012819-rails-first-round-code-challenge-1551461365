class PowersController < ApplicationController
  before_action :set_power, only:[:show,:edit,:update,:delete]

  
  def index
    @powers = Power.all
  end

  private
  def power_params
    params.require(:power).permit(:name,:description)
  end

  def set_power
    @power = Power.find(params[:id])
  end
end
