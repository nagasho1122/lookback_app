class LookbackDetailsController < ApplicationController
  def create
  end

  def destroy
    @lookback_detail.destroy
    flash[:success] = "振り返りを削除しました。"
    redirect_back(fallback_location: root_url)
  end

  def update
  end
end
