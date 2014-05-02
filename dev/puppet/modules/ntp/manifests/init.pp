
class ntp {

    # Keep ntp always updated
    package { 'ntp':
        ensure => latest,
    }

    package { 'ntpdate':
        ensure => present,
    }

    # And the service running
    service { 'ntp':
        ensure => running,
    }

    file { '/etc/ntp':
        ensure => directory,
        owner  => 'root',
        group  => 'root',
        mode   => '0700',
    }

}

