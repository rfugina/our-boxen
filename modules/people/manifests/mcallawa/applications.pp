#
# Still missing:
#   Symantec Endpoint
#   Airwatch
#   Box.com
#
class people::mcallawa::applications {

  # -- Other common tools
  include wget

  # Mac's native VIM
  include macvim

  # Cord is a remote desktop client. We include it because at times Mac's
  # native RDP capabilities have been lacking.
  include cord

  # This is a nice IRC client.
  include colloquy

  # Caffeine is a common screensaver disabler.
  include caffeine

  # Thunderbird and Firefox...
  include thunderbird
  include firefox

  # Need Mac GPG Tools
  # This required manual attention:
  # mkdir /var/folders/zz/zyxvpxvq6csfxvn_n0000000000000/T/d20141102-94809-187pzsu
  # https://github.com/boxen/puppet-gpgtools/issues/6
  include gpgtools

  # Iterm2 is a better terminal
  include iterm2::stable

  # Add Spotify for entertainment, move to another module.
  include spotify

  # Dropbox, even though it isn't officially TGI approved.
  class {'dropbox':
    version => '2.10.41',
  }

  # Adium chat client.
  class {'adium':
    version => '1.5.10',
  }

  class {'vlc':
    version => '2.1.4',
  }

  # Cyberduck too old in the repo, awaiting pull-request
  # https://github.com/boxen/puppet-cyberduck/pull/4
  #include cyberduck
  # Simple update works:
  package { 'Cyberduck':
    provider   => 'compressed_app',
    source     => 'https://update.cyberduck.io/Cyberduck-4.5.2.zip',
  }

  # TGI User Support has this on the standard list. I'd rather just use sftp.
  package {'Fugu':
    source   => 'http://downloads.sourceforge.net/project/fugussh/Release/fugu-1.2.0/Fugu-1.2.0-English.dmg',
    provider => 'appdmg_eula',
  }

  # nvalt 2.1
  package { 'nvALT':
    source   => 'http://abyss.designheresy.com/files/nvalt2.1.zip',
    provider => 'compressed_app'
  }

  # Alfred
  package { 'Alfred 2':
    ensure   => absent,
    source   => 'https://cachefly.alfredapp.com/Alfred_2.5.1_308.zip',
    provider => 'compressed_app'
  }

  # Only works inside networks.
  # FIXME: Put our stuff on a public download site? Maybe?
  #package {'Anyconnect':
  #  source   => 'https://xfer.genome.wustl.edu/gxfer1/48965403165584/anyconnect-macosx-i386-3.0.5080-k9.dmg',
  #  provider => 'appdmg',
  #}

  # I use watch all the time
  package {'watch':
    ensure   => present,
    provider => 'homebrew',
  }

  # Matt's Traceroute is handy for network diagnositcs
  package {'mtr':
    ensure   => present,
    provider => 'homebrew',
  }

  package {'graphviz':
    ensure   => present,
    provider => 'homebrew',
  }

  # -- I use ipfw to flush packet filter rules associated with Cisco VPN client
  # ipfw is gone in Yosemite, use pf via pfctl
  # http://krypted.com/mac-security/a-cheat-sheet-for-using-pf-in-os-x-lion-and-up/
  #package {'ipfw':
  #  ensure   => present,
  #  provider => 'homebrew',
  #}
  # --

  # -- Make Safari Cmd 1-9 switch tabs, like other browsers
  # https://github.com/rs/SafariTabSwitching
  # This doesn't work, but manual installation from cache does, so far
  #package {'SafariTabSwitching':
  #  source   => 'https://github.com/rs/SafariTabSwitching/releases/download/1.2.7/Safari.Tab.Switching-1.2.7.zip',
  #  provider => 'compressed_pkg',
  #}
  # --

  # -- Safari Keyword search plugin
  # http://safarikeywordsearch.aurlien.net/SafariKeywordSearch.safariextz

}
