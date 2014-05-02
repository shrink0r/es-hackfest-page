class uglifyjs {
    include nodejs

    package { 'uglify-js':
        ensure   => 'installed',
        provider => 'npm',
    }
}
