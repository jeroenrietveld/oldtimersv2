require "rvm/capistrano"
set :rvm_type, :user
default_run_options[:pty] = true  # Must be set for the password prompt
set :application, "oldtimers"
set :repository,  "git@github.com:jeroenrietveld/oldtimersv2.git"
set :branch, "master"
set :deploy_via, :remote_cache
 
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
 
set :user, "deployer"  # The server's user for deploys
 
role :web, "54.214.189.94"                          # Your HTTP server, Apache/etc
role :app, "54.214.189.94"                          # This may be the same as your `Web` server
role :db,  "54.214.189.94", :primary => true # This is where Rails migrations will run
 
# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
 
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts  
 
set :deploy_to, "/var/www/oldtimersv2/"
 
# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end