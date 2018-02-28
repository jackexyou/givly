class CreateRecipients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipients do |t|
      t.string :name
      t.text :bio
      t.text :goals
      t.string :wallet_number

      t.timestamps
    end
  end
end
