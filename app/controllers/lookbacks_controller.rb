class LookbacksController < ApplicationController
  
  def new
    @num = 0
    @lookback = current_user.lookbacks.build
    #editにて用いる変数をエラーが出ないために定義
    @done_review_ids = current_user.done_review.map(&:id)
    #@lookback_details = @lookback.lookback_details.build
    #@reviews = @lookback_details.reviews.build
  end
  
  def create
    @lookback = current_user.lookbacks.build(lookback_params)
    if @lookback.save
      flash[:success] = "振り返りを作成しました"
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = "振り返りの作成に失敗しました"
      render new_lookback_path
    end
    
  end
  
  def show
    #lookbackをparamsから取得
    @lookback = Lookback.find(params[:id])
    #@lookbackからsubjectを取得
    @subjects = @lookback.subjects.all
    #@subjectsより、各subjectのhas_manyの関係にあるlookback_detailとreviewを取得
    @subjects.each do |subject|
      instance_variable_set("@lookback_details_#{subject.id}", subject.lookback_details.all)
      instance_variable_set("@reviews_#{subject.id}", subject.reviews.all)
    end
    #doneモデルを作成
    @done = current_user.dones.build
    #達成済みの復習リストのidを配列で取得
    @done_review_ids = current_user.done_review.map(&:id)
  end
  
  def destroy
    Lookback.find(params[:id]).destroy
    flash[:success] = "振り返りを削除しました"
    redirect_to root_url
  end
  
  def index
    @lookbacks = current_user.lookbacks.all.page(params[:page]).per(10)
  end
  
  def edit
    @lookback = Lookback.find(params[:id])
    @done_review_ids = current_user.done_review.map(&:id)
  end
  
  def update
    @lookback = Lookback.find(params[:id])
    if @lookback.update(lookback_params)
      flash[:success] = "振り返りを更新しました"
      redirect_to lookback_path(@lookback)
    else
      flash.now[:danger] = "振り返りの更新に失敗しました"
      render "edit"
    end
  end
  
  private
    def lookback_params
      params.require(:lookback).permit(:university, :faculty, :department,
                    :all_text, :year, :subjects_attributes => [ :id, :subject, :_destroy, :lookback_details_attributes =>  [:id, :unit,
                    :number, :text, :_destroy], :reviews_attributes => [:id, 
                    :user_id, :content, :deadline_at, :_destroy]])
    end
  
end
