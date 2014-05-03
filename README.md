ElasticSearch Hackfest - Berlin
================

Small website to host information for the upcoming elasticsearch hackfest in berlin.

## Development

You may either develop locally or you can use the provided vagrant setup.

### Developing with vagrant

#### Requirements

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [VirtualBox Extension Pack](http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html#extpack)
* [Vagrant](http://downloads.vagrantup.com/)
* vagrant-vbguest - ```vagrant plugin install vagrant-vbguest```

#### Setup

Clone repository  
```git clone git@github.com:shrink0r/es-hackfest-page.git```

Boot and provision vagrant box
```cd es-hackfest-page/dev/vagrant```  
```vagrant up --provision```

Ssh into dev box and setup project  
```vagrant ssh```  
```cd projects```  
```git clone git@github.com:shrink0r/es-hackfest-page.git```  
```cd es-hackfest-page/app```

The site can now be built by calling: ```make``` and should be available at: [http://es-hackfest-page.local](http://es-hackfest-page.local)

### Developing locally

#### Requirements

* [jekyll](http://jekyllrb.com/) - ```gem install jekyll```
* [sass](http://sass-lang.com/install) - ```gem install sass```
* [nokogiri](https://rubygems.org/gems/nokogiri) - ```gem install nokogiri```
* [rdiscount](https://rubygems.org/gems/rdiscount) - ```gem install rdiscount```

#### Setup

Clone repository  
```git clone git@github.com:shrink0r/es-hackfest-page.git```  
```cd es-hackfest-page/app```

The site can now be built by calling: ```make```.
