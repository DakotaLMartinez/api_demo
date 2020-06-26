require "httparty"
# require "api_demo/version"
# require "api_demo/api_provider"
# require "api_demo/api"
# require "api_demo/cli"

require_relative "api_demo/version"
require_relative "api_demo/tvshow"
require_relative "api_demo/api"
require_relative "api_demo/cli"


module ApiDemo
  class Error < StandardError; end
  # Your code goes here...
end
