## main settings ##
`ssh-add` # needed for forward_agent to work properly

set :application, "potter"
set :user, 'deploy'
set :port, '2222'
set(:deploy_to) { "/home/deploy/ruby_on_rails/potter.sophisticates.de" }
#set :deploy_via, :remote_cache
set :use_sudo, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

server "monoceros.sophisticates.de:2222", :web, :app, :db, primary: true

## scm settings ##
set :scm, :git
set :branch, "master"
set :repository,  "git@github.com:Sophisticates/potter.git"
# set :scm_verbose, true


## rvm settings ##
require "rvm/capistrano"
set :rvm_ruby_string, '2.0.0-p0'
set :rvm_type, :user
set :rails_env, :production

## addons ##
require "bundler/capistrano" # That's it! Running cap deploy will now automatically run bundle install on the remote server with deployment-friendly options. A list of options that can be changed is available in the help for the cap task. To see it, run cap -e bundle:install.
require 'capistrano-unicorn'

set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"
# require "bugsnag/capistrano"



namespace :deploy do
  task :start do
    unicorn.start
  end
  
  task :stop do
    unicorn.stop
  end
  
  task :restart, :roles => :app, :except => { :no_release => true } do
    unicorn.reload
  end
  
  task :reload, :roles => :app, :except => { :no_release => true } do
    unicorn.reload
  end
  
  task :link_database_config do
    logger.info "plugging in database config"
    run "ln -fs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end  

  task :link_database do
    logger.info "plugging in database"
    run "ln -fs #{shared_path}/db/production.sqlite3 #{latest_release}/db/production.sqlite3"
  end
  
  task :link_smtp_production_config do
    logger.info "plugging in smtp production config"
    run "ln -fs #{shared_path}/config/initializers/smtp_production.rb #{latest_release}/config/initializers/smtp_production.rb"
  end
  
  namespace :db do
    desc "migrates database"
    task :migrate do
      run "cd #{current_path}; bundle exec rake db:migrate RAILS_ENV=production"
    end

    desc "setup database"
    task :setup do
      run "cd #{current_path}; bundle exec rake db:setup RAILS_ENV=production"
    end
    
    desc "populate database seeds"
    task :seed do
      run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=production"
    end
  end
  
  namespace :assets do
    # task :precompile, :roles => :web, :except => { :no_release => true } do
    #   deploy.link_database_config
    #   from = source.next_revision(current_revision)
    #   if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
    #     run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
    #   else
    #     logger.info "Skipping asset pre-compilation because there were no asset changes"
    #   end
    # end
  end
end

after 'deploy:update_code', 'deploy:link_database_config'
after 'deploy:update_code', 'deploy:link_smtp_production_config'
after 'deploy:update_code', 'deploy:link_database'
