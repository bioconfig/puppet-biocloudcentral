require 'spec_helper'

describe 'biocloudcentral' do

  let(:facts) { DEFAULT_CONTEXT }
  
  describe 'with defaults' do

    it { should contain_user('biocloudcentral') }

    it { should contain_file('/usr/share/biocloudcentral').with({
      'owner'  => 'biocloudcentral',
      'ensure' => 'directory',
    }) }

    it { should contain_python__virtualenv('/usr/share/biocloudcentral/project/venv').with({
      'systempkgs'   => false,
      'requirements' => '/usr/share/biocloudcentral/project/requirements.txt',
    })}

    it { should contain_exec('biocloudcentral_syncdb') }

  end

end