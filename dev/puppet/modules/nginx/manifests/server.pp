# puppet manifests for a nginx web-server installation
class nginx::server(
  $nginx_user = 'vagrant',
  $nginx_group = 'users',
  $nginx_worker_processes = '1',
  $nginx_worker_connections = '1024',
  $hosting_root = ""
) {

  # find out package name and install package
  $nginx_package_name = 'nginx'

  package { "$nginx_package_name":
    ensure => installed,
    alias => 'nginx'
  }

  # ensure nginx is running
  service { 'nginx':
    ensure => running,
    enable => true,
    require => [
      File["/var/log/nginx"],
      Package['nginx']
    ]
  }

  # deploy our common nginx config templates
  file {
    '/var/log/nginx':
      ensure => 'directory',
      owner => 'vagrant',
      group => 'users',
      mode => '0754';

   '/etc/nginx/nginx.conf':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => template('nginx/nginx.conf.erb'),
      notify  => Service['nginx'],
      require => Package['nginx'];

    '/etc/nginx/fastcgi_params':
      ensure  => present,
      mode    => '0744',
      owner   => 'root',
      group   => 'root',
      content => template('nginx/fastcgi_params.erb'),
      notify  => Service['nginx'],
      require => Package['nginx'];

    '/etc/nginx/mime.types':
      ensure  => present,
      source  => "puppet:///modules/nginx/mime.types",
      require => File["/etc/nginx/nginx.conf"];

    '/etc/nginx/sites-available':
      ensure => 'directory',
      mode => '0744',
      require => Package['nginx'];

    '/etc/nginx/sites-enabled':
      ensure => 'directory',
      mode => '0744',
      require => Package['nginx'];
  }

}
