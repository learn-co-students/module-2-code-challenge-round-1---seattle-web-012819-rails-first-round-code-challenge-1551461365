class HeroinesController < ApplicationController
  before_action :is_search?
  def index
    @heroines = Heroine.all
    # byebug
    @powers = Power.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end

  end

  def search
    unless search_params.blank?
      @heroines = Heroine.where(power_id: search_params)
      # byebug
      @powers = Power.all
      render :index
    else
      @heroines = Heroine.all
      render :index
    end
  end

  def is_search?
    if params[:commit] == "Search"
      search
    end
  end

  private
    def heroine_params
      params.require(:heroine).permit(:name, :super_name, :power_id)
    end
    def search_params
      params.require(:search)
    end
end
