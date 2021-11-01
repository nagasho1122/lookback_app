class AddReferencesToLookbackDetails < ActiveRecord::Migration[6.1]
  def change
    add_reference :lookback_details, :subject, null: false, foreign_key: true
  end
end
