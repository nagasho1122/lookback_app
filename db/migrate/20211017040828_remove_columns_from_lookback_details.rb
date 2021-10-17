class RemoveColumnsFromLookbackDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :lookback_details, :lookback_id, :integer
    remove_column :lookback_details, :subject, :string
  end
end
