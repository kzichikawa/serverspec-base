require 'spec_helper'

# check hostname
describe command('hostname') do
  its(:stdout) { should match "#{property[:host_name]}" }
end

# check i18n
describe file('/etc/sysconfig/i18n') do
  its(:content) { should match 'ja_JP.UTF-8' }
end

# check sshd
describe service('sshd') do
  it { should be_enabled }
  it { should be_running }
end
 
# check dns
describe host('affro.jp') do
  it { should be_resolvable }
end

# check running port
describe port(22) do
  it { should be_listening.with('tcp') }
end

     
