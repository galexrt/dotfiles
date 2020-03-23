EXECUTABLES = install ssh-agent ssh-add i3 rofi alacritty dunst openvpn wg wg-quick \
	git code zsh xrandr arandr docker go kubectl pass gopass rsync restic xclip \
	youtube-dl gpg cpupower vagrant
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

update-autocompletes: stern-autocomplete ## Update autocompletions

stern-autocomplete: ## Create / Update the wrecker stern command zsh completion
	stern --completion=zsh > .oh-my-zsh/custom/plugins/stern/stern.plugin.zsh

install: install-home-bin install-home-commander install-home-config \ ## Install everything
	install-home-i3 install-home-ohmyzsh install-home-x install-home-zshrc

install-home-bin: ## Install the scripts / binaries from the .bin/ directory
	install -v -D -m 755 .bin/screenshotrecctl -t $(HOME)/.bin/

install-home-commander: ## Install the command scripts to .commander/ directory
	install -v -D -m 755 .commander/slackstatus -t $(HOME)/.commander/
	install -v -D -m 755 .commander/vpn -t $(HOME)/.commander/

install-home-config: ## Install config files from the .config/ directory
	find .config/ -type f -exec install -v -D -m 755 "{}" "$(HOME)/{}" \;

install-home-i3: ## Install i3wm and i3pystatus config
	install -v -D -m 644 .i3/config -t $(HOME)/.i3/
	install -v -D -m 755 .i3/i3statuspy.py -t $(HOME)/.i3/

install-home-ohmyzsh: ## Install custom .oh-my-zsh plugins / themes
	find .oh-my-zsh/ -type f -exec install -v -D -m 755 "{}" "$(HOME)/{}" \;

install-home-x:  ## Install .x* and .extend.x* files to your home directory
	install -v -D -m 644 .xprofile -t $(HOME)/
	install -v -D -m 644 .extend.xprofile -t $(HOME)/
	install -v -D -m 644 .Xresources -t $(HOME)/
	install -v -D -m 644 .extend.Xresources -t $(HOME)/

install-home-zshrc: ## Install the .zshrc config
	install -v -D -m 740 .zshrc -t $(HOME)/

help: ## Show this help menu.
	@echo "Usage: make [TARGET ...]"
	@echo
	@grep -E '^[a-zA-Z_%-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
