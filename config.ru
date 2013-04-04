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
Bootstrap.init :helpers, :controllers

set :haml, :escape_html => true

run Sinatra::Application
