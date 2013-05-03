require 'spec_helper'

describe 'biocloudcentral::apache' do

  let :pre_condition do
    'include apache'
  end

  context "on Ubuntu" do
    let :facts do
      {
        :osfamily               => 'debian',
        :operatingsystem        => 'Ubuntu',
        :operatingsystemrelease => 'percise',
      }
    end

    describe 'with defaults' do

      it { should contain_apache__vhost('biocloudcentral').with({
        'port' => 80,
      })}

    end

    describe 'with ssl port' do

      let(:params) { { :port => 443 } }

      it { should contain_apache__vhost('biocloudcentral').with({
        'port' => 443,
      })}

    end

  end

end