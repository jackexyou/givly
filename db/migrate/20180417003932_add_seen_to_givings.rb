class AddSeenToGivings < ActiveRecord::Migration[5.1]
  def change    
  	add_column :givings, :seen, :boolean, :default => false 
  end
end
