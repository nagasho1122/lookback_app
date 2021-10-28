class DonesController < ApplicationController
  def index
  end
  
  def create
    @done = current_user.dones.build(done_params)
    @done.save
    @review_id = done_params[:review_id]
  end
  
  def destroy
  end
  
  private
  
  def done_params
    params.require(:done).permit(:review_id)
  end
  
end
