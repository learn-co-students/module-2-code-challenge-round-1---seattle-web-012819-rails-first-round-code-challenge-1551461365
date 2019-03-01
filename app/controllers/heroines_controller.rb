class HeroinesController < ApplicationController
  before_action :set_heroine, only: [:show]

  def index
    if params[:q] == nil
    @heroines = Heroine.all
    else
      @heroines = Heroine.all.select{|heroine| heroine.power.name == params[:q]}
    end
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else
      @errors = @heroine.errors.full_messages
      render :new
    end
  end

  private

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
