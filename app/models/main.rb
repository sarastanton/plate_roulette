class Main < ActiveRecord::Base
	
	has_many :plate_mains
	has_many :plates, through: :plate_mains

end
