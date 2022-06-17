class RamenFavoritesController < ApplicationController

  def create
    ramen = Ramen.find(params[:format])
    ramen_favorite = current_user.ramen_favorites.new(ramen_id: ramen.id)
    ramen_favorite.save
    redirect_to ramens_path
  end

  def destroy
    ramen = Ramen.find(params[:format])
    ramen_favorite = current_user.ramen_favorites.find_by(ramen_id: ramen.id)
    ramen_favorite.destroy
    redirect_to ramens_path
  end

end
