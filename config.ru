require_relative "./config/environment"
require "rack/contrib/post_body_content_type_parser"

use Rack::JSONBodyParser
run ApplicationController
