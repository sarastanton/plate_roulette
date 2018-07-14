class CreatePlate < ActiveRecord::Migration[5.2]
  def change
  	create_table :plates do |t|
  		t.string :ingredient
  		t.integer :user_id
  	end
  end
end
