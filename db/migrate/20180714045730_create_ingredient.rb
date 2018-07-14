class CreateIngredient < ActiveRecord::Migration[5.2]
  def change
  	create_table :ingredients do |t|
  		t.string :name
  		t.integer :plate_id
  	end
  end
end
