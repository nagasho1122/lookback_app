class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.datetime :deadline_at
      t.references :user, null: false, foreign_key: true
      t.references :lookback_detail, null: false, foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:user_id, :lookback_detail_id, :created_at, :deadline_at], name: 'reviews_index'
  end
end
