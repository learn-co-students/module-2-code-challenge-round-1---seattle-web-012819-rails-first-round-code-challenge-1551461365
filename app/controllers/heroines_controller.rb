class HeroinesController < ApplicationController
  before_action :set_heroine, only:[:show,:edit,:update,:delete]

  def index
    @powers = Power.all
    @heroines = Heroine.all
    if params[:power]
      @heroines = @heroines.select{|h| h.power_id == power_params[:id].to_i }
      @power = Power.find(power_params[:id])
    end
  end

  def new
    @powers = Power.all
    @heroine = Heroine.new(flash[:refill])
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      flash[:new] = true
      redirect_to heroine_path(@heroine)
    else
      flash[:refill] = @heroine.attributes
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name,:super_name, :power_id)
  end

  def power_params
    params.require(:power).permit(:id)
  end

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end
end
