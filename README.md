# Homebrew Tap — Zavora Technologies

Custom Homebrew formulae from [Zavora Technologies Ltd](https://zavora.ai).

## Installation

```bash
brew tap zavora-ai/tap
brew install zavora-cli
brew install zlm
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `zavora-cli` | ADK-Rust agent platform for terminal work |
| `zlm` | ZLaunch Manager — macOS launchd service manager CLI |

## Usage

```bash
zavora-cli setup                # Configure a model provider
zavora-cli chat                 # Open the interactive terminal workspace
zavora-cli capabilities list    # Inspect live agent capabilities
zavora-cli doctor               # Diagnose the local runtime

zlm                          # List all launchd services
zlm list -d user             # User agents only
zlm list --running           # Only running services
zlm status <label>           # Detailed service info
zlm start <label>            # Start a service
zlm stop <label>             # Stop a service
zlm restart <label>          # Restart a service
zlm logs <label>             # View service logs
zlm gui                      # Open the GUI app
zlm --help                   # Full help
```

For full documentation, see [macos-zlaunch-manager](https://github.com/zavora-ai/macos-zlaunch-manager).

## License

Apache License 2.0 — Zavora Technologies Ltd
