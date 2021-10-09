class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @lookbacks = @user.lookbacks.all
  end
end
