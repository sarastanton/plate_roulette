class CreatePlateSide < ActiveRecord::Migration[5.2]
  def change
  	create_table :plate_sides do |t|
  		t.integer :plate_id
  		t.integer :side_id
  	end
  end
end
