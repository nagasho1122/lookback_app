class ReviewsController < ApplicationController
  
  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "Todoを作成しました"
      redirect_to  user_path(current_user)
    else
      flash.now[:danger] = "Todoを作成に失敗しました"
      render user_path(current_user.id)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review_id = @review.id
    @review.destroy
  end

  def update
  end
  
  def index
    @reviews = current_user.reviews.all
    #達成済みの復習リストを取得
    @done_reviews = current_user.done_review.reorder(deadline_at: "DESC") 
    #達成済みの復習リストのidを配列で取得
    @done_review_ids = current_user.done_review.map(&:id)
    #doneモデルを作成
    @done = current_user.dones.build
    #今日の三日後を取得
    after_three_days = DateTime.now+3
    #今日の日付時間を取得
    today_full = DateTime.now
    #今日の時間を切り捨てた日付を取得
    today = DateTime.new(today_full.year, today_full.month, today_full.day)
    #復習リストの期限切れじゃないかつ直近三日でないものを全て取得
    @reviewsNotNear = current_user.reviews.where.not(id: @done_review_ids).where("deadline_at > ?", after_three_days)
    #復習リストの期限切れじゃないかつ直近三日のものを全て取得
    @reviewsNear = current_user.reviews.where.not(id: @done_review_ids).where(deadline_at:  today..after_three_days)
    #復習リストの期限切れのものを全て取得
    @reviewsExpire = current_user.reviews.where.not(id: @done_review_ids).where("deadline_at < ?", today)
    #復習リストの科目をリストで取得
    @subjects = []
    current_user.lookbacks.all.eager_load(:subjects).all.each do |lookback|
      if !lookback.subjects.empty?
        lookback.subjects.all.each do |subject|
          @subjects.push(subject.subject)
        end
      end
    end
    @subjects = @subjects.uniq
    @subjects.each do |subject|
      instance_variable_set("@reviewsNotNear_#{subject}", current_user.reviews.joins(:subject).where('subjects.subject = ?', subject).where.not(id: @done_review_ids).where("deadline_at > ?", after_three_days))
      instance_variable_set("@reviewsNear_#{subject}", current_user.reviews.joins(:subject).where('subjects.subject = ?', subject).where.not(id: @done_review_ids).where(deadline_at:  today..after_three_days))
      instance_variable_set("@reviewsExpire_#{subject}", current_user.reviews.joins(:subject).where('subjects.subject = ?', subject).where.not(id: @done_review_ids).where("deadline_at < ?", today))
    end
    @subjects.push("その他")
    instance_variable_set("@reviewsNotNear_その他", current_user.reviews.where(subject_id: nil).where.not(id: @done_review_ids).where("deadline_at > ?", after_three_days))
    instance_variable_set("@reviewsNear_その他", current_user.reviews.where(subject_id: nil).where.not(id: @done_review_ids).where(deadline_at:  today..after_three_days))
    instance_variable_set("@reviewsExpire_その他", current_user.reviews.where(subject_id: nil).where.not(id: @done_review_ids).where("deadline_at < ?", today))
    @subjects.push("達成済み")
  end
  
  private
    
    def review_params
      params.require(:review).permit(:content, :deadline_at)
    end
  
end
