class Admin::UsersController < ApplicationController
  before_action :set_user, :only => [:show, :favorites, :comments, :destroy]
  before_action :authenticate_admin!, expect: [:top]
  before_action :search_product, only: [:index, :search]

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to admin_users_path
  end



  private

  def set_user
     @user = User.find_by(:id => params[:id])
  end

  def search_product
    @user = User.ransack(params[:q])
    @results = @user.result
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end

end
