class Ingredient < ActiveRecord::Base
	
	has_many :plate_ingredients
	has_many :plates, through: :plate_ingredients

end
