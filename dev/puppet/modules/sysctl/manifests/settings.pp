
define sysctl::settings (
    $ensure     = 'present',
    $source     = '',
    $content    = '',
    $priority   = 40
) {

    $sysctl_dir = '/etc/sysctl.d'
    $sysctl_file = "${sysctl_dir}/${priority}-${name}.conf"

    exec { "reload-sysctl-${priority}-${name}-settings":
        command     => "/sbin/sysctl -p ${sysctl_file}",
        refreshonly => true,
        subscribe   => [
            File[$sysctl_file],
            File['/etc/sysctl.conf'],
        ],
        require     => File[$sysctl_file],
    }

    if $source {
        file { $sysctl_file:
            ensure => $ensure,
            source => $source,
            owner  => 'root',
            group  => 'root',
            mode   => '0644',
            notify => Exec["reload-sysctl-${priority}-${name}-settings"],
        }
    }

    if $content {
        file { $sysctl_file:
            ensure  => $ensure,
            content => "${content}
",
            owner   => 'root',
            group   => 'root',
            mode    => '0644',
            notify  => Exec["reload-sysctl-${priority}-${name}-settings"],
        }
    }

}

