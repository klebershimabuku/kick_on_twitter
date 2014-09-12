require 'json'
require 'pry'
require 'webmock/rspec'
require './kick_on_twitter/search_results'
require './app'
require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'
