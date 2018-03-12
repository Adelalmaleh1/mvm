# config valid only for current version of Capistrano
lock '~> 3.9'

# set :application, 'mvm'
# set :repo_url, "git@github.com:Adelalmaleh1/mvm.git"
# set :branch, :master
# set :deploy_to, '/home/deploy/mvm'

# set :pty, true
# set :linked_files, %w{config/database.yml config/application.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
# # set :keep_releases, 5
# set :rvm_type, :user

set :application, 'mvm' #change this to the name of your app
set :repo_url, 'git@github.com:Adelalmaleh1/mvm.git' #change this to the url of your app on github
set :deploy_to, '/home/deploy/mvm'
set :use_sudo, true
set :branch, 'master' #or whichever branch you want to use
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')



namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end