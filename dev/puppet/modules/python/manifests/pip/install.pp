define python::pip::install (
  $venv,
  $ensure = present,
  $owner  = undef,
  $group  = undef
) {
  # Match against whole line if we provide a given version:
  $grep_regex = $name ? {
    /==/    => "^${name}\$",
    default => "^${name}==",
  }

  Exec {
    user  => $owner,
    group => $group,
    cwd   => "/tmp",
  }

  if $ensure == 'present' {
    exec { "pip install $name":
      command => "$venv/bin/pip install $name",
      unless  => "$venv/bin/pip freeze | grep -e $grep_regex"
    }
  } elsif $ensure == 'latest' {
    exec { "pip install $name":
      command => "$venv/bin/pip install -U $name",
    }
  } else {
    exec { "pip install $name":
      command => "$venv/bin/pip uninstall $name",
      onlyif  => "$venv/bin/pip freeze | grep -e $grep_regex"
    }
  }
}
