class CreateLookbackDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :lookback_details do |t|
      t.string :subject
      t.integer :number
      t.text :text
      t.references :lookback, null: false, foreign_key: true

      t.timestamps
    end
  end
end
