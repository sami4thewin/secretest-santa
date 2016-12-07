class CreateGifts < ActiveRecord::Migration[5.0]
  def change
    create_table :gifts do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.string :link
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
