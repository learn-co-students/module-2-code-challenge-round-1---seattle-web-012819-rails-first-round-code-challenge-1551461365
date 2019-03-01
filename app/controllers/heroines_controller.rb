class HeroinesController < ApplicationController
   
   before_action :set_heroine, only: [:show]
   before_action :set_powers, only: [:new]


  def index
    @heroines = Heroine.all
   #  unfinished logic to index/sort by search
     @search = Heroine.new(params[:heroine])
   #  @heroines_sorted = Heroine.find_by(power: @search.power)
  end

  def new 
      flash[:notice] = nil  
      @heroine = Heroine.new 
  end 
  
   def create
      @heroine = Heroine.create(heroine_params)
      if @heroine.valid?
         redirect_to @heroine
      else
         flash[:notice] = "dis a problem, super name already taken"
         set_powers
         render new_heroine_path
      end
   end


  def show 
  end 

  private 
  
  def set_heroine
     @heroine = Heroine.find(params[:id])
  end

  def set_powers 
      @powers = Power.all
  end 
  
  def heroine_params 
     params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
 
