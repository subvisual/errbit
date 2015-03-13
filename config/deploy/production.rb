server 'log.subvisual.co', user: 'deploy', roles: %w(web app db), primary: true
set :deploy_to, '/var/www/gb-log'
