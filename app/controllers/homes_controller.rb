class HomesController < ApplicationController

  before_action :search_product, only: [:top,:index,:search]

  def top
    @ramens = Ramen.all
  end

  private

  def search_product
    @ramen = Ramen.ransack(params[:q])
    @results = @ramen.result
  end

end
