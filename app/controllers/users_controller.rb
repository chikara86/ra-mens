class UsersController < ApplicationController

  before_action :ensure_current_user, {only: [:edit, :update]}

  def show
  @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = EndUser.find(current_user.id)
    @user.update(users_params)
    redirect_to users_show_path
  end

  private

  def users_params
    params.require(:user).permit(:name, :email)
  end

end
