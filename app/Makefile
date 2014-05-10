ifeq ($(HACKFEST_ENV), development)
	scss_style := "nested"
	jekyll_configs := "config/default.yml,config/development.yml"
else
	scss_style := "compressed"
	jekyll_configs := "config/default.yml"
endif

# all scss source files
scss_files := $(shell find site/_static/scss/ -type f -name '*.scss')

# css compilation target
css_file := pub/static/css/main.css

all: html copy-static css

deploy:
	@HACKFEST_ENV='production' make all

html:
	@jekyll build --config $(jekyll_configs)

copy-static:
	@if [ ! -d pub/static ]; then mkdir -p pub/static; fi
	@rm -rf pub/static/*
	@cp -rf site/static/* pub/static/

css:  $(css_file)

$(css_file):  $(scss_files)
	@mkdir -p ${@D}
	@scss --style $(scss_style) site/_static/scss/main.scss $(css_file)

clean:
	@if [ -d pub ]; then rm -rf pub; fi

.PHONY: deploy all html css

# vim: ts=4:sw=4:noexpandtab!:
