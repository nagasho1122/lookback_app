class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :subject
      t.references :lookback, null: false, foreign_key: true

      t.timestamps
    end
  end
end
