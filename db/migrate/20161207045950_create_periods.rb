class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.string :title
      t.integer :expiration, default: 4
      t.integer :price_limit

      t.timestamps
    end
  end
end
