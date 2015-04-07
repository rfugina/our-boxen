#
# mcallawa's setup
#
# Still missing:
#   Symantec Endpoint
#   Airwatch
#   Box.com
#
class people::mcallawa {

  # -- This modifies boxen's puppet, which we don't want to do.
  #package {'puppet':
  #  provider    => 'gem',
  #  ensure      => '3.7.1',
  #}

  # Base package set includes nginx, I guess because
  # github employees do that. I don't want it running.
  service {'nginx':
    ensure => stopped
  }

  include mcallawa::development
  include mcallawa::applications
  include mcallawa::puppet
  include mcallawa::python
  include mcallawa::perl
  include mcallawa::ipa

}
