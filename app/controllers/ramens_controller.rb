class RamensController < ApplicationController
  def new
    @ramen = Ramen.new
  end

  def create
    @ramen = Ramen.new(ramen_params)
    if @ramen.save
      redirect_to ramen_path(@ramen.id)
    else
      render :new
    end
  end

  def show
    @ramen = Ramen.find(params[:id])
  end

  def index
    @ramens = Ramen.all
  end

  def edit
    @ramen = Ramen.find(params[:id])
  end

  def update
    @ramen = Ramen.find(params[:id])
    if  @ramen.update(ramen_params)
      redirect_to ramen_path(@ramen.id)
    else
      render :edit
    end
  end



  private
  def ramen_params
    params.require(:ramen).permit(:user_id, :genre_id, :area_id, :shop_name, :name, :price, :introduction, :location, :open_time, :close_time, :regular_holiday, :image)
  end

end
