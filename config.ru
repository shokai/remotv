require 'rubygems'
require 'bundler'
Bundler.require
require 'sinatra'
require 'sinatra/rocketio'
require 'sinatra/contrib'
if development?
  $stdout.sync = true
  require 'sinatra/reloader'
end

require File.expand_path 'bootstrap', File.dirname(__FILE__)
Bootstrap.init :libs, :helpers, :controllers

set :haml, :escape_html => true
set :cometio, :timeout => 60, :post_interval => 1
set :websocketio, :port => (ENV['WS_PORT'] || 8080).to_i
set :rocketio, :comet => true, :websocket => true

run Sinatra::Application
