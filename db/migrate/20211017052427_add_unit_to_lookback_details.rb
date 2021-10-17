class AddUnitToLookbackDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :lookback_details, :unit, :string
  end
end
