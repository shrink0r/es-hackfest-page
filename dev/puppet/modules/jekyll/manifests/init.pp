
class jekyll {
    include uglifyjs

    package { 'ruby-dev':
        ensure => 'installed'
    }
    -> package { 'jekyll':
        ensure   => 'installed',
        provider => 'gem',
    }
    -> package { 'sass':
        ensure   => 'installed',
        provider => 'gem',
    }
    -> package { 'libxslt1-dev':
        ensure   => 'installed',
        provider => 'apt',
    }
    -> package { 'libxml2-dev':
        ensure   => 'installed',
        provider => 'apt',
    }
    -> package { 'nokogiri':
        ensure   => 'installed',
        provider => 'gem',
    }
    -> package { 'rb-inotify':
      ensure   => 'installed',
        provider => 'gem',
    }
    -> package { 'rdiscount':
        ensure   => 'installed',
        provider => 'gem',
    }
}
