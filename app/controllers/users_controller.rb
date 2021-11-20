class UsersController < ApplicationController
  before_action :correct_user, only:[:show]
  
  def show
    #ログイン中のユーザー
    @user = User.find(params[:id])
    #reviewを作成
    @review = @user.reviews.build
    #振り返りの最新三つを取得
    @lookbacks = @user.lookbacks.first(3)
    #達成済みの復習リストのidを配列で取得
    @done_review_ids = current_user.done_review.map(&:id)
    #今日の三日後を取得
    after_three_days = DateTime.now+3
    #今日の日付時間を取得
    today_full = DateTime.now
    #今日の時間を切り捨てた日付を取得
    today = DateTime.new(today_full.year, today_full.month, today_full.day)
    #復習リストの期限切れじゃないかつ直近三日でないものを最大で６個取得
    @reviewsNotNear = @user.reviews.where.not(id: @done_review_ids).where("deadline_at > ?", after_three_days).limit(4)
    #復習リストの期限切れじゃないかつ直近三日のものを最大で６個取得
    @reviewsNear = @user.reviews.where.not(id: @done_review_ids).where(deadline_at:  today..after_three_days).limit(4)
    #復習リストの期限切れのものを最大で3個取得
    @reviewsExpire = @user.reviews.where.not(id: @done_review_ids).where("deadline_at < ?", today).limit(4)
    @done = @user.dones.build
  end
  
  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless @user == current_user
    end
end
