class ReviewsController < ApplicationController
  
  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "Todoを作成しました。"
      redirect_to  user_path(current_user)
    else
      flash.now[:danger] = "Todoを作成に失敗しました。"
      render user_path(current_user.id)
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Todoを削除しました"
    redirect_to root_url
  end

  def update
  end
  
  def index
    @reviews = current_user.reviews.all
  end
  
  private
    
    def review_params
      params.require(:review).permit(:content, :deadline_at)
    end
  
end
