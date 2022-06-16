class RamenCommentsController < ApplicationController

  def index
    @ramen = Ramen.find(params[:format])
    @ramen_comment = RamenComment.new
  end

  def create
    ramen = Ramen.find(ramen_comment_params[:ramen_id])
    ramen_comment = current_user.ramen_comments.new(ramen_comment_params)
    ramen_comment.ramen_id = ramen.id
    ramen_comment.save
    redirect_to request.referer
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
