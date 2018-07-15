class CreateMain < ActiveRecord::Migration[5.2]
  def change
  	create_table :mains do |t|
  		t.string :name
  		t.integer :plate_id
  	end
  end
end
