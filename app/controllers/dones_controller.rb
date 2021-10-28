class DonesController < ApplicationController
  def index
  end
  
  def create
    @done = current_user.dones.build(done_params)
    if @done.save
      flash[:success] = "Todoを達成しました。"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
  end
  
  private
  
  def done_params
    params.require(:done).permit(:review_id)
  end
  
end
