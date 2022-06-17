class UsersController < ApplicationController

  before_action :ensure_current_user, {only: [:edit, :update]}

  def show
    @user = User.find(params[:id])
    @ramens = @user.ramens
    @ramen_favorites = RamenFavorite.all
  end

  def edit
  end

  def update
    @user = User.find(current_user.id)
    @user.update(users_params)
    redirect_to user_path
  end

  private

    def ensure_current_user
      @user = User.find(params[:id])
      if @user != current_user
        flash[:notice] = "権限がありません"
        redirect_to(root_path)
      end
    end





  def users_params
    params.require(:user).permit(:name, :email)
  end

end
