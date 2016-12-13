class AddPeriodsToGifts < ActiveRecord::Migration[5.0]
  def change
    add_column :gifts, :period_id, :integer
  end
end
