
class cron {

    package { 'cron':
        ensure => present,
    }

    service { 'cron':
        ensure => running,
    }

}

