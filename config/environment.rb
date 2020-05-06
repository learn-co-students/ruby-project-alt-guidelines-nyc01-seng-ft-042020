require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'


    # require 'rake'
    # require 'active_record'
    # require 'yaml/store'
    # require 'ostruct'
    # require 'date'


    # require 'bundler/setup'
    # Bundler.require

    # ActiveRecord::Base.establish_connection(
    #     :adapter => "sqlite3",
    #     :database => "db/artists.sqlite"
    #   )

    # require_relative "../artist.rb"


        # require "bundler/setup"
        # Bundler.require
        # require "sinatra/activerecord"
        # require "ostruct"
        # require "date"
        # require_all 'app/models'

        # ENV["SINATRA_ENV"] ||= 'development'
        # ActiveRecord::Base.establish_connection(ENV["SINATRA_ENV"].to_sym)

