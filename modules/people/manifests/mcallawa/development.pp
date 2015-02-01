#
# Development tools
#
class people::mcallawa::development {

  # -- Common autotools for compilation
  include autoconf
  include automake

  # -- Add java, happens to be a prereq for pyenv too for jython.
  include java

  # -- Virtualbox is essential for TGI development
  class {'virtualbox':
    version     => '4.3.18',
    patch_level => '96516',
  }

  # -- Vagrant is essential for TGI development
  # As of 20150201 vagrant-openstack-plugin doesn't work with Vagrant 1.7 yet
  class {'vagrant':
    version => '1.6.5',
  }

}
