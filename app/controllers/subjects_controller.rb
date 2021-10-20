class SubjectsController < ApplicationController
  
  def create
  end
  
  def destroy
    Subject.find(params[:id]).destroy
    flash[:success] = "大問を削除しました"
    redirect_to root_url
  end
  
  def update
  end
end
