class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    set_power
  end

  private

  def set_power
    @power = Power.find(params[:id])
  end
end
