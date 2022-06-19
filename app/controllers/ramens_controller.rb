class RamensController < ApplicationController

  before_action :search_product, only: [:index, :show, :search]



  def new
    @ramen = Ramen.new
  end

  def create
    @ramen = Ramen.new(ramen_params)
    @ramen.user_id = current_user.id
    if @ramen.save
      redirect_to ramen_path(@ramen.id)
    else
      render :new
    end
  end

  def show
    @ramen = Ramen.find(params[:id])
    @ramen_comment = RamenComment.new
  end

  def index
  end

  def edit
    @ramen = Ramen.find(params[:id])
    unless @ramen.user == current_user
      redirect_to  root_path
    end
  end

  def update
    @ramen = Ramen.find(params[:id])
    if  @ramen.update(ramen_params)
      redirect_to ramen_path(@ramen.id)
    else
      render :edit
    end
  end

  def destroy
    ramen = Ramen.find(params[:id])
    ramen.destroy
    redirect_to ramens_path
  end


  private

  def search_product
    @ramen = Ramen.ransack(params[:q])
    @results = @ramen.result
  end


  def ramen_params
    params.require(:ramen).permit(:user_id, :genre_id, :area_id, :shop_name, :name, :price, :introduction,:latitude, :longitude, :location, :business_hours, :regular_holiday, :image)
  end



end
