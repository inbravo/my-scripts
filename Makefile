DOTFILES_DIR := $(shell pwd)/dotfiles
SCRIPTS_DIR  := $(shell pwd)
BIN_DIR      := /usr/local/bin

SCRIPT_DIRS := shell git dev system network utils

DOTFILES := \
	.zprofile \
	.zsh_aliases \
	.gitconfig \
	.profile \
	.zshrc \
	.bash_profile

.PHONY: install install-dotfiles install-scripts uninstall list

install: install-dotfiles install-scripts

install-dotfiles:
	@echo "Symlinking dotfiles to ~/..."
	@for f in $(DOTFILES); do \
		target="$$HOME/$$f"; \
		source="$(DOTFILES_DIR)/$$f"; \
		if [ -L "$$target" ]; then \
			echo "  skip (already symlinked): $$f"; \
		elif [ -f "$$target" ]; then \
			echo "  backup -> $$f.bak"; \
			mv "$$target" "$$target.bak"; \
			ln -sf "$$source" "$$target" && echo "  linked: $$f"; \
		else \
			ln -sf "$$source" "$$target" && echo "  linked: $$f"; \
		fi \
	done
	@echo "Done. Restart your shell or run: source ~/.zprofile"

install-scripts:
	@echo "Symlinking scripts to $(BIN_DIR)..."
	@for dir in $(SCRIPT_DIRS); do \
		for script in $(SCRIPTS_DIR)/$$dir/*.sh; do \
			[ -f "$$script" ] || continue; \
			name=$$(basename "$$script" .sh); \
			ln -sf "$$script" "$(BIN_DIR)/$$name" && echo "  linked: $$name"; \
		done \
	done
	@echo "Scripts available globally."

uninstall:
	@echo "Removing symlinks..."
	@for f in $(DOTFILES); do \
		target="$$HOME/$$f"; \
		if [ -L "$$target" ]; then \
			rm "$$target" && echo "  removed: $$f"; \
		fi \
	done

list:
	@echo "Tracking these dotfiles:"
	@for f in $(DOTFILES); do \
		target="$$HOME/$$f"; \
		if [ -L "$$target" ]; then \
			echo "  [symlinked] $$f -> $$(readlink $$target)"; \
		elif [ -f "$$target" ]; then \
			echo "  [file]      $$f (not yet symlinked — run make install)"; \
		else \
			echo "  [missing]   $$f"; \
		fi \
	done
