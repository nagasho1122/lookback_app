class CreateDones < ActiveRecord::Migration[6.1]
  def change
    create_table :dones do |t|
      t.integer :user_id
      t.integer :review_id

      t.timestamps
    end
    add_index :dones, :user_id
    add_index :dones, :review_id
  end
end
