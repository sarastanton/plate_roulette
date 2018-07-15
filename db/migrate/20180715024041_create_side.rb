class CreateSide < ActiveRecord::Migration[5.2]
  def change
  	create_table :sides do |t|
  		t.string :name
  		t.integer :plate_id
  	end
  end
end
