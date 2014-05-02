
class locales {

    package { 'locales':
        ensure => 'latest',
    }

    file { '/etc/locale.gen':
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        source  => ['puppet:///modules/locales/locale.gen'],
        require => Package['locales'],
    }

    exec { '/usr/sbin/locale-gen':
        refreshonly => true,
        subscribe   => File['/etc/locale.gen'],
        require     => [
            Package['locales'],
            File['/etc/locale.gen'],
        ]
    }

}

