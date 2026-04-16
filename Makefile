.PHONY: install install-dry install-verbose verify update info browse logs help

install: ## Run the interactive installer
	@bash install.sh

install-dry: ## Preview what would be installed (no changes)
	@bash install.sh --dry-run

install-verbose: ## Run installer with full command output
	@bash install.sh --verbose

verify: ## Check current install status of all tools and apps
	@bash installer/verify.sh

update: ## Pull latest config and re-run installer
	@bash installer/update.sh

info: ## List all tools or get details (usage: make info raycast)
	@bash installer/info.sh $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))

browse: ## Interactive fuzzy search across all tools (requires gum)
	@bash installer/info.sh browse

%:
	@:

logs: ## Show the most recent install log
	@ls -t logs/install-*.log 2>/dev/null | head -1 | xargs cat 2>/dev/null || echo "No install logs found. Run 'make install' first."

help: ## Show available commands
	@echo ""
	@echo "  Brewkit"
	@echo "  ──────────────────"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ""
