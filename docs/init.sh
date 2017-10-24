bundle install
rake db:drop
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
rake categories:init
rake portfolios:init
rake comments:init
