require 'bundler'

ENV['RACK_ENV'] ||= ENV.fetch('RACK_ENV', 'development')
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

%w(. ../app ../config).each do |p|
  $LOAD_PATH.unshift File.expand_path(p, File.dirname(__FILE__))
end

require 'robot'
require 'direction'
