class CreatePlateIngredient < ActiveRecord::Migration[5.2]
  def change
  	create_table :plate_ingredients do |t|
  		t.integer :plate_id
  		t.integer :ingredient_id
  	end
  end
end
