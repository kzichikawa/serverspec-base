require 'spec_helper'

# check php install and version
describe command('php -v') do
  its(:stdout) { should match /^PHP 5\.5\./ }
end


describe package('php55-mbstring') do
  it { should be_installed }
end

describe package('php55-pdo') do
  it { should be_installed }
end

describe package('php55-xml') do
  it { should be_installed }
end

# check php timezone
describe file('/etc/php.ini') do
  it { should be_file }
  it { should contain("Asia/Tokyo").after(/^date\.timezone/) }
end
