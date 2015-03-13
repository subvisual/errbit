# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!
environment ENV['RACK_ENV'] || 'development'

rackup DefaultRackup

if ENV["RAILS_ENV"] == "production"
  bind "unix:///apps/#{ENV['APP_NAME']}/shared/sockets/puma.sock"
else
  port ENV['PORT'] || 8080
end


on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
