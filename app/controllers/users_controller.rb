class UsersController < ApplicationController
  
  def show
    #ログイン中のユーザー
    @user = User.find(params[:id])
    #reviewを作成
    @review = @user.reviews.build
    #振り返りの最新三つを取得
    @lookbacks = @user.lookbacks.first(3)
    #今日の三日後を取得
    after_three_days = DateTime.now+3
    #今日の日付時間を取得
    today_full = DateTime.now
    #今日の時間を切り捨てた日付を取得
    today = DateTime.new(today_full.year, today_full.month, today_full.day)
    #復習リストの期限切れじゃないかつ直近三日でないものを最大で６個取得
    @reviewsNotNear = @user.reviews.where("deadline_at > ?", after_three_days).limit(4)
    #復習リストの期限切れじゃないかつ直近三日のものを最大で６個取得
    @reviewsNear = @user.reviews.where(deadline_at:  DateTime.now..after_three_days).limit(4)
    #復習リストの期限切れのものを最大で3個取得
    @reviewsExpire = @user.reviews.where("deadline_at < ?", today).limit(4)
    #復習リストの科目をリストで取得
    @subjects = []
    @user.lookbacks.all.eager_load(:subjects).all.each do |lookback|
      # usersテーブルから名前を取得し、カンマ区切りで結合する
      if !lookback.subjects.empty?
        lookback.subjects.pluck(:subject).each do |subject|
          @subjects.push(subject)
        end
      end
    end
    @subjects = @subjects.uniq
  end
end
