class CreateLookbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :lookbacks do |t|
      t.string :university
      t.string :faculty
      t.string :department
      t.integer :year
      t.text :all_text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :lookbacks, [:user_id, :created_at]
  end
end
