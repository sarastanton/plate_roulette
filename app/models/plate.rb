class Plate < ActiveRecord::Base
	
	belongs_to :user
	has_many :plate_ingredients
	has_many :ingredients, through: :plate_ingredients

end