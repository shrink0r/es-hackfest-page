
class sysctl {

    file { '/etc/sysctl.conf':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
    }

    file { '/etc/systl.d':
        ensure => directory,
        owner  => 'root',
        group  => 'root',
        mode   => '0755',
    }

    sysctl::settings { 'tcp-performance':
        source => 'puppet:///modules/sysctl/tcp/performance.conf',
    }

    sysctl::settings { 'inotify-tools-performance':
        source => 'puppet:///modules/sysctl/inotify/userwatches.conf',
    }

    sysctl::settings { 'kernel-tuning':
        source => 'puppet:///modules/sysctl/kernel/tuning.conf',
    }
}

