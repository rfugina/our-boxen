# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.
github "boxen", "3.7.0"

# Support for default hiera data in modules
github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.
#
#github "dnsmasq",     "2.0.0"
#github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.5.0"
github "go",          "1.1.0"
github "homebrew",    "1.9.8"
github "hub",         "1.3.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
#github "nginx",       "1.4.3"
github "nodejs",      "3.8.1"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.4"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen. Note that several of these
# actually perform installs, which we would've liked
# to put in ./modules rather than deploy everywhere.
#
github "autoconf",    "1.0.0"
github "automake",    "1.0.0"
github "adium",       "1.4.0"
github "caffeine",    "1.0.0"
github "colloquy",    "1.0.0"
github "cord",        "1.0.0"
github "cyberduck",   "1.0.1"
github "dropbox",     "1.4.1"
github "firefox",     "1.2.3"
github "gpgtools",    "1.0.3"
github "iterm2",      "1.2.2"
github "java",        "1.7.1"
github "macvim",      "1.0.0"
github "spotify",     "1.0.2"
github "thunderbird", "1.4.0"
github "vagrant",     "3.2.0"
github "vlc",         "1.1.0"
github "virtualbox",  "1.0.13"
github "wget",        "1.0.1"

# Support for python via pyenv
mod "puppet-zlib",
  :git => "https://github.com/mattheath/puppet-zlib.git",
  :ref => "6e739e8ad179948c37012932f71382c82f028bef"

# We forked to apply ensure_packages() for a package{} to
# avoid a conflict. This installs pyenv without needing
# to be 'included' later, which surprised me.
mod "puppet-python",
  :git => "https://github.com/mcallaway/puppet-python.git",
  :ref => "61d7f07837c3778e748ac7fb10328dc7171919a6"

