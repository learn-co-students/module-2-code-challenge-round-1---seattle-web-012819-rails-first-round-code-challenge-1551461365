class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.search(params[:term])
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      flash[:notice] = "Heroine creation successful"
      redirect_to heroine_path(@heroine)
    else
      flash[:notice] = "Something went wrong, please try again"
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :term)
  end
end
