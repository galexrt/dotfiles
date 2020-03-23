EXECUTABLES = install
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

update-autocompletes: stern-autocomplete

stern-autocomplete:
	stern --completion=zsh > .oh-my-zsh/custom/plugins/stern/stern.plugin.zsh

install: install-home-bin install-home-commander install-home-config \
	install-home-i3 install-home-misc install-home-ohmyzsh install-home-zshrc

install-home-bin:
	install -v -D -m 755 .bin/screenshotrecctl -t $(HOME)/.bin/

install-home-commander:
	install -v -D -m 755 .commander/slackstatus -t $(HOME)/.commander/
	install -v -D -m 755 .commander/vpn -t $(HOME)/.commander/

install-home-config:
	find .config/ -type f -exec install -v -D -m 755 "{}" "$(HOME)/{}" \;

install-home-i3:
	install -v -D -m 644 .i3/config -t $(HOME)/.i3/
	install -v -D -m 755 .i3/i3statuspy.py -t $(HOME)/.i3/

install-home-misc:
	install -v -D -m 644 .xprofile -t $(HOME)/
	install -v -D -m 644 .extend.xprofile -t $(HOME)/
	install -v -D -m 644 .Xresources -t $(HOME)/
	install -v -D -m 644 .extend.Xresources -t $(HOME)/

install-home-ohmyzsh:
	find .oh-my-zsh/ -type f -exec install -v -D -m 755 "{}" "$(HOME)/{}" \;

install-home-zshrc:
	install -v -D -m 740 .zshrc -t $(HOME)/
