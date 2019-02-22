require "sinatra"
require "sinatra/reloader"
require "pg"
require "faker"
require_relative "models/Attendence.rb"
require_relative "models/Students.rb"

require_relative "models/Search.rb"

require_relative "models/Groups.rb"

require_relative "controllers/attendence_controller.rb"
require_relative "controllers/student_controller.rb"
require_relative "controllers/search_controller.rb"
require_relative "controllers/group_controller.rb"



use Rack::MethodOverride
use SearchController


use AttendenceController
use GroupController
run StudentController
