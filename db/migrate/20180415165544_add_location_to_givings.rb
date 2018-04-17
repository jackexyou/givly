class AddLocationToGivings < ActiveRecord::Migration[5.1]
  def change
    add_column :givings, :location, :string
  end
end
