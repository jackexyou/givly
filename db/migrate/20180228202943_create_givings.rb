class CreateGivings < ActiveRecord::Migration[5.1]
  def change
    create_table :givings do |t|
      t.float :amount
      t.integer :recipient_id
      t.integer :giver_id

      t.timestamps
    end
  end
end
