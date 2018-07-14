class PlateIngredient < ActiveRecord::Base

	belongs_to :plate
	belongs_to :ingredient

end