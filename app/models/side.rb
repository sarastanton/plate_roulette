class Side < ActiveRecord::Base

	has_many :plate_sides
	has_many :plates, through: :plate_sides

end
