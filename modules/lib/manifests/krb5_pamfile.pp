#
# Augeas resource for editing pamfiles
#
# lib::krb5_pamfile { "/etc/pam.d/authorization": }
#
define lib::krb5_pamfile {
  augeas {$title:
    changes => [
      "set /files/${title}/*[module = 'pam_krb5.so']/argument[last()+1] default_principal",
    ],
    onlyif  => "match /files/${title}/*[module = 'pam_krb5.so']/argument[. = 'default_principal'] size == 0",
  }
}
