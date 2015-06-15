require 'spec_helper'

# check php-fpm install
describe package('php55-fpm') do
  it { should be_installed }
end

# check php-fpm running
describe service('php-fpm') do
  it { should be_running }
end

# check conf file
describe file('/etc/php-fpm.d/www.conf') do
  it { should be_file }
end

