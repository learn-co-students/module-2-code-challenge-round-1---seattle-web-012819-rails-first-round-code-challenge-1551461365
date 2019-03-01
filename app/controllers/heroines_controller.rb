class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.search(params[:search])
  end

  # def search
  #   binding.pry
  #   power = Power.find(params[:power])
  #   @heroines = []
  #   Heroine.all.each do |her|
  #     if her.power == power
  #       @heroines << her
  #     end
  #   end
  # end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else 
      flash[:notice] = "Your name must be unique!"
      redirect_to new_heroine_path
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :search)
  end
end
