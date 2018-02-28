class CreateGivers < ActiveRecord::Migration[5.1]
  def change
    create_table :givers do |t|
      t.string :username

      t.timestamps
    end
  end
end
