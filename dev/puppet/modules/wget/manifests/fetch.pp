define wget::fetch(
	$source,
 	$destination,
  	$timeout = '0',
  	$verbose = false
) {

  	include wget

  	$verbose_option = $verbose ? {
    	true  => '--verbose',
    	false => '--no-verbose'
  	}

  	exec { "wget-$name":
	    command => "wget $verbose_option --output-document=$destination $source",
    	timeout => $timeout,
    	unless  => "test -s $destination",
    	path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin:/opt/local/bin',
    	require => Class['wget'],
  	}
}