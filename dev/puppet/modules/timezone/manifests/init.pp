
class timezone (
    $timezone = 'Etc/UTC'
) {

    include cron

    package { 'tzdata':
        ensure => 'latest',
    }

    file { '/etc/localtime':
        ensure  => link,
        target  => "/usr/share/zoneinfo/${timezone}",
        # Trigger cron restart to run jobs in the correct timezone
        notify  => Service['cron'],
        require => Package['tzdata'],
    }

    file { '/etc/timezone':
        ensure  => present,
        content => "$timezone\n",
        owner   => 'root',
        notify  => Service['cron'],
    }

}

