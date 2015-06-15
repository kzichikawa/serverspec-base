require 'spec_helper'

# check sshd
describe service('mysqld') do
  it { should be_enabled }
  it { should be_running }
end
 
# check running port
describe port(3306) do
  it { should be_listening }
end

# check conf file
describe file('/etc/my.cnf') do
  it { should be_file }
end

