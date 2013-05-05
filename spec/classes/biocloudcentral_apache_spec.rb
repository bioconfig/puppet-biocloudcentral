require 'spec_helper'

describe 'biocloudcentral::apache' do
  
  let(:facts) { DEFAULT_CONTEXT }

  let :pre_condition do
    'include apache'
  end

  describe 'with defaults' do

    it { should contain_apache__vhost('biocloudcentral').with({
      'port' => 80,
      'ssl'  => false,
    })}

    it { should_not contain_file('/etc/ssl/biocloudcentral.key') }
  end

  describe 'with ssl' do

    let(:params) { { :port     => 443, 
                     :ssl_key  => '1234567',
                     :ssl_cert => 'ABCDEF',
    } }

    it { should contain_apache__vhost('biocloudcentral').with({
      'port' => 443,
      'ssl'  => true,
    })}

    it { should contain_file('/etc/ssl/biocloudcentral.key').with({
      'content' => '1234567',
    })}

    it { should contain_file('/etc/ssl/biocloudcentral.cert').with({
      'content' => 'ABCDEF',
    })} 

  end

end