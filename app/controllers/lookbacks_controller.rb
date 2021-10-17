class LookbacksController < ApplicationController
  
  def new
    @num = 0
    @lookback = current_user.lookbacks.build
    #@lookback_details = @lookback.lookback_details.build
    #@reviews = @lookback_details.reviews.build
  end
  
  def create
    @lookback = current_user.lookbacks.build(lookback_params)
    if @lookback.save
      redirect_to user_path(current_user)
    else
      render new_lookback_path
    end
    
  end
  
  def destroy
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  private
    def lookback_params
      params.require(:lookback).permit(:university, :faculty, :department,
                    :all_text, :year, :subjects_attributes => [ :subject, :_destroy, :lookback_details_attributes =>  [:id, :unit,
                    :number, :text, :_destroy], :reviews_attributes => [:id, 
                    :user_id, :content, :deadline_at, :_destroy]])
    end
  
end
