require_relative './config/environment'

use Rack::MethodOverride

use IngredientsController
use PlatesController
use UsersController
run ApplicationController