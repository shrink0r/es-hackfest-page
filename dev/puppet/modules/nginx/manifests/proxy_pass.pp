# puppet manifests for nginx proxy_pass definitions
define nginx::proxy_pass(
  $proxy_pass_name = $title,
  $location        = '/',
  $app_server_name = 'jenkins',
  $app_server_url  = 'http://127.0.0.1:8080',
  $server_name     = 'box.ci',
  $listen_port     = '80'
) {

  file {
    "/etc/nginx/sites-available/$proxy_pass_name":
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => template('nginx/sites-available/proxy_pass_location.erb'),
      require => Package["nginx"],
      notify  => Service['nginx'];

    "/etc/nginx/sites-enabled/$proxy_pass_name":
      ensure  => link,
      target  => "/etc/nginx/sites-available/$proxy_pass_name",
      owner   => 'root',
      group   => 'root',
      require => File["/etc/nginx/sites-available/$proxy_pass_name"],
      notify  => Service['nginx'];
  }
}

