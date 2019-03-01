class HeroinesController < ApplicationController
  before_action :all_heroines, only: [:index]
  before_action :new_heroine, only: [:new]
  before_action :find_heroine, only: [:show, :edit, :update]
  
  # The following methods are handled by before_action:

  # implied index
  # implied new
  # implied show
  # implied edit

  def create
    @heroine = Heroine.create(heroine_params)
    unless @heroine
      flash[:errors] << "Could not create that heroine"
    else
      redirect_to @heroine
    end
  end

  def update
    unless @heroine.update(heroine_params)
      flash[:errors] << "Could not update that heroine"
    else
      redirect_to @heroine
    end
  end

  private

  def all_heroines
    @heroines = Heroine.all
  end

  def new_heroine
    @heroine = Heroine.new
  end

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
