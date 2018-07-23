mains = {
	"grilled chicken" => {
	}, 
	"salmon" => {
	},  
	"ground beef" => {
	},  
	"tofu" => {
	}, 
	"pork chops" => {
	}, 
	"steak" => {
	}, 
	"tuna" => {
	},  
	"meatballs" => {
	},  
	"turkey burgers" => {
	}, 
	"shrimp" => {
	},
	"meatloaf" => {
	},
	"tilapia filets" => {
	},
	"soup" => {
	}	
  }

sides = {
	"steamed broccoli" => {
	},
	"steamed carrots" => {
	},
	"spinach" => {
	},
	"zucchini" => {
	},
	"squash" => {
	},
	"okra" => {
	},
	"macaroni" => {
	},
	"rice" => {
	},
	"quinoa" => {
	},
	"roasted potatoes" => {
	},
	"salad" => {
	},
	"kale" => {
	},
	"stuffed peppers" => {
	},
	"asparagus" => {
	},
	"mashed potatoes" => {
	},
	"brussels sprouts" => {
	},
	"corn on the cob" => {
	},
	"potato salad" => {
	}
  }

mains.each do |name, figure_hash|
	m = Main.new
	m.name = name
	m.save
end  

sides.each do |name, figure_hash|
	s = Side.new
	s.name = name
	s.save
end  