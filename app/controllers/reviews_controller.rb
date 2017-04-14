class ReviewsController < ApplicationController

  def create
    raise "Yay, I'm here!"
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
