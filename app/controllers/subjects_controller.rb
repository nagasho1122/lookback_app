class SubjectsController < ApplicationController
  
  def create
  end
  
  def destroy
    Subject.find(params[:id]).destroy!
  end
  
  def update
  end
end
