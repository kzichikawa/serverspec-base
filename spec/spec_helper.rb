require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'yaml'
require 'rspec/its'
set :request_pty, true
set :backend, :ssh

properties = YAML.load_file('properties.yml')

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']

options = Net::SSH::Config.for(host)

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options


#include Serverspec::Helper::Ssh
#include Serverspec::Helper::DetectOS
#
#RSpec.configure do |c|
#  c.host  = ENV['TARGET_HOST']
#  options = Net::SSH::Config.for(c.host)
#  user    = options[:user] || Etc.getlogin
#  c.ssh   = Net::SSH.start(c.host, user, options)
#  c.os    = backend.check_os
#end


RSpec.configure do |c|
  c.path = '/bin:/sbin:/usr/sbin:/usr/local/sbin:$PATH'
end

# Set PATH
#set :path, '/bin:/sbin:/usr/sbin:/usr/local/sbin:$PATH'
