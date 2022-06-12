class Admin::AreasController < ApplicationController

  def index
    @areas = Area.all
    @area = Area.new
  end

  def edit
    @area = Area.find(params[:id])
  end

  def create
    @areas = Area.all
    @area = Area.new(area_params)
    if @area.save
      redirect_to admin_areas_path
    else
      render :index
    end
  end

  def update
    @area = Area.find(params[:id])
    if @area.update(area_params)
      redirect_to admin_areas_path
    else
      render :edit
    end
  end

  private
  def area_params
    params.require(:area).permit(:area)
  end
end
