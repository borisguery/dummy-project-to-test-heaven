set :deploy_config_path, "deployment/setup.rb"
set :stage_config_path, "deployment/stages/"

# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Include tasks from other gems included in your Gemfile

require 'capistrano/symfony'
require 'capistrano/composer'
require 'capistrano/npm'

# Load custom tasks
Dir.glob('deployment/tasks/*.cap').each { |r| import r }
