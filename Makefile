.PHONY: server build watch

THEME_DIR = themes/ag

server:
	hugo server --watch --verbose --cleanDestinationDir --disableFastRender

package:
	npm run --prefix $(THEME_DIR) build

dev: build
	npm run --prefix $(THEME_DIR) watch

build: package
	hugo