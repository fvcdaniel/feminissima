set :rvm_ruby_string, '1.9.3-p429'

set :application, "Feminissima Modas"
set :repository,  "git://github.com/fvcdaniel/feminissima.git"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "feminissimamodas.com.br"                          # Your HTTP server, Apache/etc
role :app, "feminissimamodas.com.br"                          # This may be the same as your `Web` server
role :db,  "feminissimamodas.com.br", :primary => true # This is where Rails migrations will run
role :db,  "feminissimamodas.com.br"

default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work
set :scm, "git"
set :scm_username, "fvcdaniel"
set :user, "deployer"  # The server's user for deploys
#set :scm_passphrase, "password"  # The deploy user's password
set :ssh_options, { :forward_agent => true }
set :branch, "master"
set :deploy_via, :remote_cache
set :git_enable_submodules, 1
set :deploy_to, "/var/www/feminissimamodas.com.br"

after :deploy, 'deploy:database'
namespace :deploy do
    task :database, :roles => :app do
    	run "cp #{deploy_to}/shared/database.yml #{current_path}/config/"
    	run "cp #{deploy_to}/shared/secret_token.rb #{current_path}/config/initializers/secret_token.rb"
        run "cd #{deploy_to}/current && RAILS_ENV=production bundle exec rake db:migrate"
        run "cd #{deploy_to}/current && RAILS_ENV=production bundle exec rake assets:precompile"
    end
end

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end