# Linux System Toolkit

A collection of practical tools for Linux system administrators, IT technicians, and infrastructure engineers.

Linux-specific tools are maintained here; Windows-specific tools remain in the [Windows System Toolkit](https://github.com/mkosednar/Windows-System-Toolkit).

## Supported distributions

The initial target is Linux distributions that provide a standard Bash environment. Planned coverage includes:

- Ubuntu and Debian
- Fedora
- Red Hat Enterprise Linux (RHEL)
- Rocky Linux and AlmaLinux

Compatibility is documented per tool where it has been assessed. Do not assume that a script has been tested on every listed distribution.

## Current repository contents

The repository is an early work in progress. **Only the following functional script is currently implemented:**

| File | Purpose | Behavior |
| --- | --- | --- |
| `01-System-Diagnostics/system-overview.sh` | Basic Linux system overview | Read-only diagnostic |

Supporting documentation:

- `docs/SAFETY.md` — safety baseline.
- `.gitignore` and `.gitattributes` — repository configuration.

## Planned areas (not implemented yet)

The following directories describe the intended roadmap. They are not currently populated with scripts:

| Planned directory | Intended scope |
| --- | --- |
| `02-System-Maintenance/` | Maintenance and repair tasks with explicit safeguards |
| `03-Security/` | Security posture checks and auditing |
| `04-Networking/` | Network interface, connectivity, DNS, and routing diagnostics |
| `05-Server-Administration/` | Common Linux server administration tasks |
| `06-Automation/` | Bash, Python, and infrastructure automation |
| `07-Utilities/` | Small focused command-line utilities |

## Getting started

Make the existing script executable before running it:

```bash
chmod +x 01-System-Diagnostics/system-overview.sh
./01-System-Diagnostics/system-overview.sh
```

Review scripts before execution. Some tools may behave differently across distributions and versions.

## Safety principles

- Diagnostic tools should be read-only by default.
- Any operation that changes system state must explain its effects and require deliberate confirmation.
- Never run a script with `sudo` unless its documentation explicitly explains why elevated privileges are required.
- Do not publish reports containing hostnames, usernames, IP addresses, serial numbers, or other private system details without reviewing them.

See [docs/SAFETY.md](docs/SAFETY.md) for the project safety baseline.

## Project status and testing

Work in progress. Tools are added incrementally. Compatibility and testing status will be stated per tool. The current script has not been certified as production-tested across the supported distributions; validate it in your own environment before relying on it.

## License

No license has been selected yet. Until a license is added, the repository does not grant general permission to use, modify, or redistribute its contents.
