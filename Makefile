.PHONY: server build watch

THEME_DIR = themes/ag

server:
	hugo server --watch --verbose --cleanDestinationDir --disableFastRender

dev: build
	npm run --prefix $(THEME_DIR) watch

build:
	npm run --prefix $(THEME_DIR) build
	hugo
