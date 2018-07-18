require './config/environment'

use Rack::MethodOverride

use PlatesController
use UsersController
run ApplicationController