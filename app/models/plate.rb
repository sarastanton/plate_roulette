class Plate < ActiveRecord::Base
	
	belongs_to :user
	has_many :plate_mains
	has_many :plate_sides
	has_many :mains, through: :plate_mains
	has_many :sides, through: :plate_sides

end