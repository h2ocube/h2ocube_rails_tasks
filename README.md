# SUMMARY

[![Gem Version](https://badge.fury.io/rb/h2ocube_rails_tasks.png)](http://badge.fury.io/rb/h2ocube_rails_tasks)

This is a plugin to add some useful tasks to rails.

## Installation

Add this line to your application's Gemfile:

    gem 'h2ocube_rails_tasks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install h2ocube_rails_tasks

## Usage

    # has .git folder
    rake git:clear                      # Clear files in .gitignore
    rake git:commit[comment]            # Git commit with your comment
    rake git:pull[from]                 # Git pull
    rake git:push[comment, to]          # Git push with your comment

    # has unicorn.rb
    rake unicorn:restart                # Hot restart unicorn server
    rake unicorn:start                  # Start unicorn server
    rake unicorn:stop                   # Stop unicorn server

    # has config/rainbows.rb
    rake rainbows:restart               # Hot restart rainbows server
    rake rainbows:start                 # Start rainbows server
    rake rainbows:stop                  # Stop rainbows server

    # has config/puma.rb
    rake puma:restart                   # Hot restart puma server
    rake puma:start                     # Start puma server
    rake puma:stop                      # Stop puma server

    # has config/database.yml
    rake mysql:dump                     # mysqldump
    rake mysql:restore                  # restore mysql with dump data
    rake mysql:dump_all                 # mysqldump
    rake mysql:restore_all              # restore mysql with dump data

    rake postgresql:dump                # pg_dump
    rake postgresql:restore             # pg_restore

    # has config/mongoid.yml
    rake mongodb:dump                   # mongodump
    rake mongodb:restore                # mongorestore
    rake mongodb:repair                 # Repair Mongodb

    # has initializers/resque.rb
    rake resque:clear                   # Clear Resque data
    rake resque:debug                   # Start Resque for debug
    rake resque:start                   # Start Resque daemon worker
    rake resque:stop                    # Stop Resque worker
    rake resque:web                     # Start Resque web interface

    # others
    rake locales:sort                   # Sort config/locales/*.yml
    rake db:dump                        # Dump all database
    rake db:restore                     # Restore all database
    rake backup                         # Backup all things

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
