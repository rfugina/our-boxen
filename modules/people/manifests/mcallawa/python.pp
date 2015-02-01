#
class people::mcallawa::python {

  # requires puppet-python in Puppetfile
  #
  # -- python setup via pyenv
  exec { "python 2.7.8":
    command => "env -i bash -c 'source /opt/boxen/env.sh && CFLAGS=\"-I$(xcrun --show-sdk-path)/usr/include\" pyenv install 2.7.8'",
    creates => "/opt/boxen/pyenv/versions/2.7.8/bin/python",
  }
  # Mavericks needed CFLAGS set to set include path
  case $::macosx_productversion_major {
    10.9: {
      $342command = "env -i SHELL=/bin/bash CFLAGS=\"-I$(xcrun --show-sdk-path)/usr/include\" /bin/bash -l -c 'source /opt/boxen/env.sh && pyenv install 3.4.2'"
    }
    # Yosemite appears to have fixed this
    default: {
      $342command = "env -i SHELL=/bin/bash /bin/bash -l -c 'source /opt/boxen/env.sh && pyenv install 3.4.2'"
    }
  }
  exec { "python 3.4.2":
    command => $342command,
    creates => "/opt/boxen/pyenv/versions/3.4.2/bin/python",
  }
  python::package { "python-novaclient for 2.7.8":
    package => 'python-novaclient',
    python  => '2.7.8',
  }
  # Set my default python version
  python::local { "/Users/${::boxen_user}":
    version => '2.7.8'
  }
  # --

}
