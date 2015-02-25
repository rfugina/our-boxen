#
# Set a puppet development environment
#
class people::mcallawa::puppet {

  # -- This modifies boxen's puppet, which we don't want to do.
  # I'm leaving this in here as a reminder to NOT do this.
  # Use puppet ruby_gem entry to add the puppet we want to use.
  #package {'puppet':
  #  provider    => 'gem',
  #  ensure      => '3.7.1',
  #}

  $ruby_version = '1.9.3-p545'
  ruby_gem { "puppet for ${ruby_version}":
     gem          => 'puppet',
     version      => '~> 3.6.2',
     ruby_version => $ruby_version,
  }
  ruby_gem { "puppet-lint for ${ruby_version}":
     gem          => 'puppet-lint',
     version      => '~> 1.0.1',
     ruby_version => $ruby_version,
  }
  ruby_gem { "librarian-puppet for ${ruby_version}":
     gem          => 'librarian-puppet',
     version      => '~> 1.0.9',
     ruby_version => $ruby_version,
  }
  ruby_gem { "hiera-eyaml for ${ruby_version}":
     gem          => 'hiera-eyaml',
     version      => '~> 2.0.6',
     ruby_version => $ruby_version,
  }
  ruby_gem { "hiera-eyaml-gpg for ${ruby_version}":
     gem          => 'hiera-eyaml-gpg',
     version      => '~> 0.4',
     ruby_version => $ruby_version,
  }
  ruby_gem { "ruby-augeas for ${ruby_version}":
     gem          => 'ruby-augeas',
     ruby_version => $ruby_version,
  }
  ruby_gem { "beaker for ${ruby_version}":
     gem          => 'beaker',
     ruby_version => $ruby_version,
  }
  ruby_gem { "beaker-librarian for ${ruby_version}":
     gem          => 'beaker-librarian',
     ruby_version => $ruby_version,
  }
  ruby_gem { "beaker-rspec for ${ruby_version}":
     gem          => 'beaker-rspec',
     ruby_version => $ruby_version,
  }
  package {'augeas':
    ensure   => present,
    provider => 'homebrew',
  }
}
