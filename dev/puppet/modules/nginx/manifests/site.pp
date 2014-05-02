# puppet manifests for a nginx site definitions
define nginx::site(
  $name = $title,
  $server_name = $name,
  $docroot = "/srv/www/${name}",
  $listen_port = '80',
  $fastcgi_pass = '127.0.0.1:9000',
  $access_log = "/var/log/nginx/access.${name}.log",
  $client_max_body_size = "60M",
  $norewrite = "NO",
  $site_template = 'nginx/sites-available/fcgi_site.erb'
) {

  file {
    "/etc/nginx/sites-available/${name}":
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => template($site_template),
      require => Package["nginx"],
      notify => Service['nginx'];
    "/etc/nginx/sites-enabled/${name}":
      ensure => link,
      target => "/etc/nginx/sites-available/${name}",
      owner   => 'root',
      group   => 'root',
      require => File["/etc/nginx/sites-available/${name}"],
      notify  => Service['nginx'];
  }

}
