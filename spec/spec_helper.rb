require 'puppetlabs_spec_helper/module_spec_helper' 
require 'rspec-puppet'

DEFAULT_CONTEXT = {
  :osfamily               => 'debian',
  :operatingsystem        => 'Ubuntu',
  :operatingsystemrelease => 'percise',
}

# In upcoming version rspec-puppet.
#RSpec.configure do |c|
#  c.default_facts = DEFAULT_CONTEXT
#end
