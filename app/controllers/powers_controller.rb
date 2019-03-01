class PowersController < ApplicationController
  before_action :all_powers, only: [:index]
  before_action :new_power, only: [:new]
  before_action :find_power, only: [:show, :edit, :update]
  
  # The following methods are handled by before_action:

  # implied index
  # implied new
  # implied show
  # implied edit

  def create
    @power = power.create(power_params)
    unless @power
      flash[:errors] << "Could not create that power"
    else
      redirect_to @power
    end
  end

  def update
    unless @power.update(power_params)
      flash[:errors] << "Could not update that power"
    else
      redirect_to @power
    end
  end

  private

  def all_powers
    @powers = Power.all
  end

  def new_power
    @power = Power.new
  end

  def find_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description, :heroines_id)
  end
end
