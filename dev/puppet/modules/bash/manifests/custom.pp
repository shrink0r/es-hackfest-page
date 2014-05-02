define bash::custom(
  $user    = $title,
  $home    = "/home/${user}",
  $aliases = true,
  $bashrc  = true
)
{

  if $user == undef {
    fail('You must specify an existing user!')
  }

  if $bashrc == true {
    file { "${home}/.bashrc":
        ensure  => present,
        owner   => $user,
        group   => $user,
        mode    => '0640',
        content => template('bash/bashrc.erb'),
    }
  }

  if $aliases == true {
    file { "${home}/.bash_aliases":
        ensure  => present,
        owner   => $user,
        group   => $user,
        mode    => '0640',
        content => template('bash/bash_aliases.erb'),
    }
  }
}
