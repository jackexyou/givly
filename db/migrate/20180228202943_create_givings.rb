class CreateGivings < ActiveRecord::Migration[5.1]
  def change
    create_table :givings do |t|
      t.float :amount

      t.timestamps
    end
  end
end
