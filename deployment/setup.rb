# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'dummy-project'
set :repo_url, 'git@github.com:borisguery/dummy-project-to-test-heaven.git'

# Use ENV variable to set the branch/revision or use the current checked out branch
set :branch, ENV["REVISION"] || ENV["BRANCH"] || proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :deploy_to, '/var/www/test'

set :log_level, :info

SSHKit.config.command_map[:composer] = "php #{shared_path.join("composer.phar")}"

set :composer_install_flags, '--no-interaction --quiet --optimize-autoloader'
set :npm_flags, '--silent --no-progress'

set :linked_files, fetch(:linked_files, []).push('.env')


set :keep_releases, 10

namespace :deploy do

  after :starting, 'composer:install_executable'
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
