class Admin::RamensController < ApplicationController
before_action :authenticate_admin!

  def show
    @ramen = Ramen.find(params[:id])
  end

  def destroy
    ramen = Ramen.find(params[:id])
    user = ramen.user
    ramen.destroy
    redirect_to admin_user_path(user.id)
  end
end