# Homebrew Tap — Zavora Technologies

Custom Homebrew formulae from [Zavora Technologies Ltd](https://zavora.ai).

## Installation

```bash
brew tap zavora-ai/tap
brew install lm
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `lm` | macOS launchd service manager CLI |

## Usage

```bash
lm                          # List all launchd services
lm list -d user             # User agents only
lm list --running           # Only running services
lm status <label>           # Detailed service info
lm start <label>            # Start a service
lm stop <label>             # Stop a service
lm restart <label>          # Restart a service
lm logs <label>             # View service logs
lm --help                   # Full help
```

For full documentation, see [macos-launch-manager](https://github.com/zavora-ai/macos-launch-manager).

## License

Apache License 2.0 — Zavora Technologies Ltd
