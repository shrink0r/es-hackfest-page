class avahi::daemon {
  package { "avahi-daemon":
    ensure => installed
  }

  package { "libnss-mdns":
    ensure => installed
  }
}
