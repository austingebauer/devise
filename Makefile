.PHONY: server build watch

THEME_DIR = themes/ag

server:
	hugo server --watch --verbose --buildDrafts --cleanDestinationDir --disableFastRender

build:
	npm run --prefix $(THEME_DIR) build

watch: build
	npm run --prefix $(THEME_DIR) watch

publish: build
	hugo