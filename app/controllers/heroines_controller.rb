class HeroinesController < ApplicationController

  def index
    @heroines = Heroine.all #refactor if needed eventually when 'search' works
  end

  def show
    @heroine = Heroine.find(params[:id])
    @power = @heroine.power
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine= Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      render :new
    end
  end

#based on the url in the search GIF, I don't need this route
  def search
    @heroines = Heroine.all #possible refactor
    @specific_heroines = @heroines.collect do |heroine|
      if heroine.power_id == (params[:power_id]) #using power_id before name of power for simplicity to ensure routes work
      end
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end


end
