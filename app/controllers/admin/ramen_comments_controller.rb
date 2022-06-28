class Admin::RamenCommentsController < ApplicationController
   before_action :authenticate_admin!


  def index
    @ramen = Ramen.find(params[:format])
  end

  def destroy
    RamenComment.find(params[:format]).destroy
    redirect_to request.referer
  end

  private

  def ramen_comment_params
    params.require(:ramen_comment).permit(:comment,:ramen_id)
  end

end
