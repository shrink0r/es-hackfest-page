class git {

  require sysconfig::users

  class client {
    package { 'git':
      ensure => installed,
    }
  }

  define clone(
    $source,
    $localtree = "/srv/git/",
    $user = "root"
  ) {
    exec { "git clone $source $localtree":
      unless => "ls $localtree/.git",
      require => Package['git'],
      user => $user,
      timeout => 3600,
      creates => "$localtree/.git/",
      logoutput => true,
    }
    -> exec {"chown -R vagrant:users ${localtree}":}
  }

}
