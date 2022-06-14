class HomesController < ApplicationController
  def top
    @ramens = Ramen.all
  end
end
