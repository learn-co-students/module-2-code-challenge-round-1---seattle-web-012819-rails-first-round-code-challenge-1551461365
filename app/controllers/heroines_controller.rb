class HeroinesController < ApplicationController
  # could use before action, but would only be using it for the show method in this app.
  # before_action :set_heroine, only: [:show]

  def index
    @heroines = Heroine.all
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
      flash[:notice] = "Your Heroine has been Successfully Created!"
      redirect_to heroine_path(@heroine)
    else
      flash[:errors] = @heroine.errors.full_messages
      render :new
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  # def set_heroine
  #   @heroine = Heroine.find(params[:id])
  # end

end
