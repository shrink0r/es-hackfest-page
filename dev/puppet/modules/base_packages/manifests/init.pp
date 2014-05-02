class base_packages {

    $packagelist = [
        'build-essential',

        'ack-grep',
        'autoconf',
        'bc',
        'bzip2',
        'colordiff',
        'curl',
        'debconf',
        'debconf-utils',
        'dmidecode',
        'dnsutils',
        'elinks',
        'ethtool',
        #'gcc',
        #'gdb',
        'gnupg',
        'htop',
        'ifenslave-2.6',
        'iftop',
        'inotify-tools',
        'iotop',
        'iptraf',
        'less',
        'libwww-perl',
        'libxml2-utils',
        'logrotate',
        'lsb-release',
        'lsof',
        'lynx-cur',
        'make',
        'manpages-posix',
        'manpages-posix-dev',
        'mc',
        'moreutils',
        'mtr',
        #'mysqltuner',
        #'ncftp',
        #'oprofile',
        'otp',
        'p7zip-full',
        'patch',
        'pigz',
        'psmisc',
        'pwgen',
        'rar',
        'rsync',
        'screen',
        'smart-notifier',
        'socat',
        'ssh',
        'strace',
        'sudo',
        'sysstat',
        'tcpdump',
        'tcpflow',
        'telnet',
        'tree',
        'trickle',
        'unzip',
        'unrar',
        'w3m',
        'whois',
        'zip',
        'openssl'
    ]

    package { $packagelist:
        ensure => present,
    }

    file { '/usr/bin/ack':
        ensure  => link,
        target  => '/usr/bin/ack-grep',
        owner   => 'root',
        require => Package['ack-grep'],
    }
    file { "/var/www/":
      ensure => directory,
      owner => 'root',
      group => 'root',
      mode => '0610',
    }
    # makes sure that 'vagrant' can use sudo without typing in a password
    if $environment == "production" {
        file { '/etc/sudoers':
            ensure  => present,
            mode    => '0440',
            content => template("base_packages/etc/production-sudoers.erb")
        }
    }
    else {
        file { '/etc/sudoers':
            ensure  => present,
            mode    => '0440',
            content => template("base_packages/etc/development-sudoers.erb")
        }
    }
}
