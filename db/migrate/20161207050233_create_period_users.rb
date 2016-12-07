class CreatePeriodUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :period_users do |t|
      t.integer :period_id
      t.integer :user_id

      t.timestamps
    end
  end
end
