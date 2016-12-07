class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :gift_id
      t.integer :tally, default: 0

      t.timestamps
    end
  end
end
