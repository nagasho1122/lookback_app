class ReviewsController < ApplicationController
  
  def create
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Todoを削除しました"
    redirect_to root_url
  end

  def update
  end
  
end
