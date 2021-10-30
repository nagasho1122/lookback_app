class DonesController < ApplicationController
  def index
  end
  
  def create
    @done = current_user.dones.build(done_params)
    @done.save
    @review_id = done_params[:done_review_id]
    #達成済みの復習リストを配列で取得
    @done_reviews = current_user.done_review.reorder(deadline_at: "DESC") 
  end
  
  def destroy
  end
  
  private
  
  def done_params
    params.require(:done).permit(:done_review_id)
  end
  
end
