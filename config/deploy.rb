require 'bundler/capistrano'

set :application, "filmbastardi.cz"
set :deploy_via, :remote_cache
set :user, 'filmbastardi_cz'

# Settings

default_environment["PATH"] = "/opt/ruby-enterprise/bin:/usr/bin:/bin:/usr/sbin:/sbin"
default_run_options[:pty]   = true
ssh_options[:forward_agent] = true
set :use_sudo, false


set :scm, :git
set :repository, "git@github.com:mmagnusek/bastardi-sinatra.git"
set :branch, 'master'
set :git_enable_submodules, 1
set :keep_releases, 3
set :deploy_to, "/var/www/filmbastardi_cz"

server "zoidberg.blueberry.cz", :web, :app, :db, :primary => true


namespace :deploy do
 # No start or stop task with Phusion Passenger
 [:start, :stop].each do |t|
   desc "#{t} task is a no-op with mod_rails"
   task t, :roles => :app do ; end
 end

 desc "Tell Passenger to restart the app."
 task :restart do
   run "touch #{current_path}/tmp/restart.txt"
 end

 desc "Symlink shared assets on each release."
 task :symlink_shared do
   run "ln -nfs #{deploy_to}/shared/production.db #{release_path}/production.db"
 end

 task :install_bundle do
   run "cd #{release_path} && bundle install"
 end
end

after 'deploy:update_code', 'deploy:symlink_shared'
# after 'deploy:update_code', 'deploy:install_bundle'
after "deploy", "deploy:cleanup"
