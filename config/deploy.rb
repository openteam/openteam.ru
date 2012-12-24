require "bundler/capistrano"
require "rvm/capistrano"

load "config/deploy/settings"

namespace :deploy do
  task :generate_pages, :roles => :app do
    run "cd #{deploy_to}/current/ bundle install"
    run "cd #{deploy_to}/current/ && bin/rake generate"
  end
end

after "deploy", "deploy:generate_pages"
