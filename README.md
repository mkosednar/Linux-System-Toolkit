# Linux System Toolkit

A collection of practical, carefully documented tools for Linux system administrators, IT technicians, and infrastructure engineers.

The project focuses on system diagnostics, maintenance, security, networking, server administration, and automation. Linux-specific tools are maintained here; Windows-specific tools remain in the [Windows System Toolkit](https://github.com/mkosednar/Windows-System-Toolkit).

## Supported distributions

The initial target is Linux distributions that provide a standard Bash environment. Distribution-specific compatibility will be documented by each tool. Planned coverage includes:

- Ubuntu and Debian
- Fedora
- Red Hat Enterprise Linux (RHEL)
- Rocky Linux and AlmaLinux

## Repository structure

| Directory | Purpose |
| --- | --- |
| `01-System-Diagnostics/` | Read-only system, hardware, storage, memory, and process diagnostics |
| `02-System-Maintenance/` | Maintenance and repair tasks with explicit safeguards |
| `03-Security/` | Security posture checks and auditing |
| `04-Networking/` | Network interface, connectivity, DNS, and routing diagnostics |
| `05-Server-Administration/` | Common Linux server administration tasks |
| `06-Automation/` | Bash, Python, and infrastructure automation |
| `07-Utilities/` | Small focused command-line utilities |
| `docs/` | Usage, safety, compatibility, and contribution guidance |

## Getting started

Make a script executable before running it:

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

## Project status

Work in progress. Tools are added incrementally; compatibility and testing status will be stated per tool. A script should not be considered production-tested until it has been exercised on the documented distributions.

## License

No license has been selected yet. Until a license is added, the repository does not grant general permission to use, modify, or redistribute its contents.
