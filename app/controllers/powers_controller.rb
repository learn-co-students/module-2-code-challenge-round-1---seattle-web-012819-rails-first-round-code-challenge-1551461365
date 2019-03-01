class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
    @heroines = Heroine.where(power_id: @power.id)
  end

  def new
    @power = Power.new
  end

  def create
    power = Power.create(power_params)
    if power.valid?
      redirect_to power_path(power)
      flash[:notice] = "Power Successfully Created"
    else
      redirect_to new_power_path
      flash[:notice] = "That Power already exists, please try again."
    end
  end

  private

  def power_params
    params.require(:power).permit(:name, :description)
  end
end
