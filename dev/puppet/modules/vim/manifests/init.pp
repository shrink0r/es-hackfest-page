
class vim {

    package { 'vim':
        ensure => present,
    }

    exec { 'sudo update-alternatives --set editor /usr/bin/vim.basic':
        path   => '/bin:/sbin:/usr/bin:/usr/sbin',
        unless => 'test /etc/alternatives/editor -ef /usr/bin/vim.basic'
    }

    file { '/etc/vim/vimrc.local':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        source  => ['puppet:///modules/vim/vimrc.local'],
        require => Package['vim'],
    }
}

