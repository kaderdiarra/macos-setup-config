# macOS Setup Config

Personal MacBook configuration reference — tools, apps, and dev environment setup with an interactive CLI installer.

## Quick Start

```bash
git clone https://github.com/YOUR_USERNAME/macos-setup-config.git
cd macos-setup-config
make install
```

## Commands

```bash
make install           # Run the interactive installer
make install-dry       # Preview what would be installed (no changes)
make install-verbose   # Run installer with full command output
make verify            # Check current install status of all tools and apps
make logs              # Show the most recent install log
make help              # Show all available commands
```

## How It Works

The installer runs 6 phases:

1. **Prerequisites** — installs Xcode CLI tools, Homebrew, and gum (interactive UI)
2. **Selection** — pick a bundle (Minimal, Web Dev, Full) or custom-select items
3. **Resolution** — checks what's already installed, builds an install plan
4. **Confirmation** — shows summary and asks for confirmation
5. **Installation** — installs everything with progress tracking
6. **Configuration** — sets up Git, SSH, shell aliases, system preferences

### Bundles

| Bundle | What's included |
|--------|----------------|
| **Minimal** | Core tools (terminal, launcher, git) |
| **Web Dev** | Full-stack web development essentials |
| **Full** | Everything in the config |
| **Custom** | Pick and choose what you want |

### Features

- Idempotent — safe to re-run, skips what's already installed
- Graceful fallback — works without gum (basic terminal prompts)
- Verbose mode — see full brew output with `--verbose`
- Dry run — preview all commands before executing
- Signal handling — clean interruption with Ctrl+C
- Logging — all output saved to `logs/`

## Structure

```
.
├── apps/              # macOS applications
├── dev-tools/         # Core development tools
├── editor/            # Code editor setup & extensions
│   └── extensions/
├── system/            # macOS system configuration
├── references/        # External resources & inspiration
├── installer/         # Interactive CLI installer
│   ├── lib/           # Shared utilities (colors, checks, UI, logging)
│   ├── registry/      # Data-driven tool/app definitions
│   ├── phases/        # Installation phases
│   └── bundles.sh     # Predefined setup bundles
└── install.sh         # Main entry point
```

## System

| Config | Description |
|--------|-------------|
| [macOS Settings](system/macos-settings.md) | Display, dock, desktop, hot corners, login items, Finder |

## Apps

| App | Description |
|-----|-------------|
| [AltTab](apps/alttab.md) | Windows-style alt-tab with window previews |
| [Arc](apps/arc.md) | Clean Chromium-based browser with sidebar tabs & workspaces |
| [DBeaver](apps/dbeaver.md) | Universal database management tool — SQL editor, ER diagrams |
| [Hidden Bar](apps/hidden-bar.md) | Free menu bar icon manager — hides top bar clutter |
| [iTerm2](apps/iterm2.md) | Feature-rich terminal emulator — split panes, search, customization |
| [itsycal](apps/itsycal.md) | Tiny menu bar calendar with events |
| [Kap](apps/kap.md) | Open-source screen recorder — GIF, MP4, WebM |
| [Keka](apps/keka.md) | File archiver — compress/extract 7z, ZIP, RAR, and more |
| [NotchNook](apps/notchnook.md) | Turns MacBook notch into media controls, file tray & more |
| [Raycast](apps/raycast.md) | Spotlight replacement — launch apps, manage windows, extensions |
| [Rectangle](apps/rectangle.md) | Free window management with keyboard shortcuts |
| [Stats](apps/stats.md) | Menu bar system monitor — CPU, RAM, network, battery, clock |
| [Sublime Text](apps/sublime-text.md) | Fast, lightweight text editor for quick edits |
| [Time Out](apps/time-out.md) | Break timer — micro breaks to prevent strain |

## Dev Tools

| Tool | Description |
|------|-------------|
| [CLI Tools](dev-tools/cli-tools.md) | wget, telnet, tldr |
| [Git](dev-tools/git.md) | Version control + SSH key setup for GitHub |
| [Homebrew](dev-tools/homebrew.md) | macOS package manager — install everything from the terminal |
| [NVM](dev-tools/nvm.md) | Node.js version manager + useful global npm packages |
| [Oh My Zsh](dev-tools/oh-my-zsh.md) | Zsh framework — themes, plugins, aliases |

## Editor

| Tool | Description |
|------|-------------|
| [VS Code](editor/vscode.md) | Code editor — setup, recommended settings |

### Extensions

#### Essentials

| Extension | Description |
|-----------|-------------|
| [Auto Close Tag](editor/extensions/auto-close-tag.md) | Auto-insert closing HTML/XML tags |
| [Auto Rename Tag](editor/extensions/auto-rename-tag.md) | Auto-rename paired HTML/XML tags |
| [Code Spell Checker](editor/extensions/code-spell-checker.md) | Catch spelling mistakes in code |
| [DotENV](editor/extensions/dotenv.md) | Syntax highlighting for .env files |
| [Error Lens](editor/extensions/error-lens.md) | Show errors/warnings inline |
| [ESLint](editor/extensions/eslint.md) | JS/TS linting with inline errors and auto-fix |
| [Prettier](editor/extensions/prettier.md) | Opinionated code formatter |
| [Pretty TypeScript Errors](editor/extensions/pretty-typescript-errors.md) | Human-readable TypeScript errors |

#### Productivity

| Extension | Description |
|-----------|-------------|
| [Auto Barrel](editor/extensions/auto-barrel.md) | Auto-generate barrel (index.ts) export files |
| [Better Comments](editor/extensions/better-comments.md) | Color-coded comments by type |
| [Bookmarks](editor/extensions/bookmarks.md) | Mark and jump between bookmarked lines |
| [Code Runner](editor/extensions/code-runner.md) | Run code snippets in 40+ languages |
| [CodeSnap](editor/extensions/codesnap.md) | Take beautiful code screenshots |
| [Font Size Shortcuts](editor/extensions/font-size-shortcuts.md) | Change font size without zooming UI |
| [Import Cost](editor/extensions/import-cost.md) | Show imported package bundle size inline |
| [Paste JSON as Code](editor/extensions/paste-json-as-code.md) | Convert JSON to TypeScript types and more |
| [Peacock](editor/extensions/peacock.md) | Color-code your workspaces |
| [Project Manager](editor/extensions/project-manager.md) | Switch between projects quickly |
| [Todo Highlight](editor/extensions/todo-highlight.md) | Highlight TODO/FIXME annotations |
| [Todo Tree](editor/extensions/todo-tree.md) | Tree view of TODO/FIXME across project |
| [Turbo Console Log](editor/extensions/turbo-console-log.md) | Insert console.log with shortcuts |

#### IntelliSense

| Extension | Description |
|-----------|-------------|
| [IntelliSense (Path + npm)](editor/extensions/intellisense.md) | Autocomplete file paths and npm modules |
| [PostCSS IntelliSense](editor/extensions/postcss-intellisense.md) | Syntax highlighting & intellisense for PostCSS |
| [Tailwind CSS IntelliSense](editor/extensions/tailwind-css-intellisense.md) | Autocomplete & preview for Tailwind classes |

#### Snippets

| Extension | Description |
|-----------|-------------|
| [JavaScript Snippets](editor/extensions/js-snippets.md) | ES6/ES7 JS code snippets |
| [React Snippets](editor/extensions/react-snippets.md) | Simple React + ES7+ React/Redux snippets |

#### Git

| Extension | Description |
|-----------|-------------|
| [GitHub Copilot](editor/extensions/github-copilot.md) | AI-powered code completion |
| [GitHub Pull Requests](editor/extensions/github-pr.md) | Review and manage PRs from VS Code |
| [GitLens](editor/extensions/gitlens.md) | Git blame, history, and code authorship |

#### Testing

| Extension | Description |
|-----------|-------------|
| [Testing (Jest + Playwright)](editor/extensions/testing.md) | Jest Runner, Jest, Playwright integration |

#### Media

| Extension | Description |
|-----------|-------------|
| [Paste Image & Image Preview](editor/extensions/paste-image-preview.md) | Paste & preview images in code comments |

#### Tools

| Extension | Description |
|-----------|-------------|
| [Docker](editor/extensions/docker.md) | Manage containers and images from VS Code |
| [Thunder Client](editor/extensions/thunder-client.md) | Lightweight REST API client — Postman alternative |

#### Remote Development

| Extension | Description |
|-----------|-------------|
| [Remote Development](editor/extensions/remote-development.md) | SSH, Containers, Remote Explorer |

#### Languages

| Extension | Description |
|-----------|-------------|
| [Language Support (YAML, MDX)](editor/extensions/language-support.md) | YAML and MDX language support |

#### Vim

| Extension | Description |
|-----------|-------------|
| [Vim Extension](editor/extensions/vim.md) | Vim keybindings + cheatsheet + learn-vim tutorial |

#### Themes & Icons

| Extension | Description |
|-----------|-------------|
| [Themes & Icons](editor/extensions/theme-and-icons.md) | GitHub Theme, Glyph, Material icons, vscode-icons |

## References

| Resource | Description |
|----------|-------------|
| [Dotfiles & Setup Inspiration](references/dotfiles-inspiration.md) | External dotfiles repos, Brewfiles, VS Code configs to reference |

## Adding New Tools

To add a new app/tool to the installer, add one entry to the appropriate registry file:

```bash
# installer/registry/apps.sh — add an app
"myapp|My App|--cask myapp|app|/Applications/My App.app|Description here"

# installer/registry/dev-tools.sh — add a dev tool
"mytool|My Tool|brew:mytool|command|mytool|Description here"

# installer/registry/editor.sh — add a VS Code extension
"myext|My Extension|publisher.extension-id|Description|category"
```

Then add the key to any bundles in `installer/bundles.sh` where it should be included.
