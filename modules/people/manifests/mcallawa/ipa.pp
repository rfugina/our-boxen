#
# Configure macbook for IPA integration
#
class people::mcallawa::ipa {

  # Configure Kerberos for Genome's IPA server. This
  # is a template file from a default Yosemite image.
  # It would be better to use an augeas .ini parser
  # I think. Not sure if that exists.
  file { '/etc/krb5.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0644',
    content => template('people/krb5.conf.erb'),
  }
  # Small changes to Yosemite's pam configuration
  # so that we integrate with Kerberos.
  $pamfiles = [
    '/etc/pam.d/authorization',
    '/etc/pam.d/login',
    '/etc/pam.d/screensaver',
    '/etc/pam.d/sshd',
  ]
  lib::krb5_pamfile { $pamfiles: }
}
