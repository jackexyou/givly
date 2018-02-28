class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.string :store_name
      t.string :wallet_number

      t.timestamps
    end
  end
end
