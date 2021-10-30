class CreateDones < ActiveRecord::Migration[6.1]
  def change
    create_table :dones do |t|
      t.integer :user_id
      t.integer :done_review_id

      t.timestamps
    end
    add_index :dones, :user_id
    add_index :dones, :done_review_id
    add_index :dones, [:user_id, :done_review_id], unique: true 
  end
end
