class RemoveLookbackDetailIdFromReview < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :lookback_detail_id, :integer
  end
end
