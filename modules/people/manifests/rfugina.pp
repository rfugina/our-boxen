#
# rfugina's setup
#
class people::rfugina {

  # Base package set includes nginx, I guess because
  # github employees do that. I don't want it running.
  service {'nginx':
    ensure => stopped
  }

  # Add Matt's base development stuff for puppet, etc.
  #include mcallawa::development

  # This is a reference to Matt's apps, as a starting point.
  #include mcallawa::applications

}
