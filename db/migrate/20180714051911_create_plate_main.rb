class CreatePlateMain < ActiveRecord::Migration[5.2]
  def change
  	create_table :plate_mains do |t|
  		t.integer :plate_id
  		t.integer :main_id
  	end
  end
end
