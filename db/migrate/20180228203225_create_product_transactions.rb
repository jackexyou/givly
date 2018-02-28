class CreateProductTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :product_transactions do |t|

      t.timestamps
    end
  end
end
