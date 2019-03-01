class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    power = Power.find_by(name: params["q"])
    if power
      @power_heroines = Heroine.where(power_id: power.id)
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    heroine = Heroine.create(heroine_params)
    if heroine.valid?
      redirect_to heroine_path(heroine)
      flash[:notice] = "Heroine Successfully Created"
    else
      redirect_to new_heroine_path
      flash[:notice] = "A Heroine with that Super Name already exists, please try again."
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
