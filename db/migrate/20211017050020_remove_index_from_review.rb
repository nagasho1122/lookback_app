class RemoveIndexFromReview < ActiveRecord::Migration[6.1]
  def change
      remove_index :reviews, :lookback_detail_id
  end
end
