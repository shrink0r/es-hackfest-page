# set PATH for commands, that are run by puppet's 'exec' task
Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', '/usr/local/bin/' ] }

# set our default package provider
Package { provider => 'apt' }

# system configuration
require sysconfig::users
#require sysconfig::repositories

# ssh configuration for vagrant and root
include ssh::server
ssh::user { "vagrant":
  home => "/home/vagrant"
}
ssh::user { "root":
  home => "/root"
}

# setup nfs-exports so we can mount our project for development
class { 'nfs::server':
  exports => {
    "/home/vagrant/projects" => '0.0.0.0/0.0.0.0(anonuid=1000,anongid=100,no_subtree_check,rw,insecure,all_squash)'
  }
}

# basic software our box should have
include base_packages
include locales
include bash
include cron
include ntp
include sysctl
class { 'timezone':
  timezone => 'Europe/Berlin'
}
include vim
include wget
include git::client

# make the box' host name resolvable via zeroconf
include avahi::daemon

include nginx::server
nginx::site { "es-hackfest-page.local":
  name => "es-hackfest-page.local",
  docroot => "/home/vagrant/projects/es-hackfest-page/app/pub",
  norewrite => "YES"
}

include jekyll

file { "/home/vagrant/projects":
  ensure => 'directory',
  owner => 'vagrant',
  group => 'users',
  mode => '0754',
  require => Package['nginx'];
}
