# Safety and Operating Principles

This repository contains scripts that inspect or administer Linux systems. Read each complete script and its documentation before running it.

## Default Behavior

- Diagnostic tools should not change system configuration, install packages, delete files, restart services, or alter firewall rules.
- Scripts should avoid network requests unless network activity is explicitly part of the documented purpose.
- Scripts should not collect credentials, private keys, tokens, or unrelated personal data.
- Reports should be saved locally and should not be committed unless they have been reviewed and sanitized.

## Privileges

- Prefer running tools without elevated privileges.
- If root access is required, the tool must explain which operation requires it and why.
- Do not recommend piping remote scripts directly into a shell.
- Never use `sudo` as a blanket workaround for permission errors.

## Changes to System State

Any tool that changes system state must:

1. Explain exactly what it will change.
2. Provide a preview or dry-run mode where practical.
3. Require explicit confirmation before making changes.
4. Handle errors without silently continuing after a critical failure.
5. Document recovery or rollback steps where feasible.

## Testing and Compatibility

- State supported distributions and minimum versions.
- Distinguish static review from actual runtime testing.
- Test in a disposable virtual machine before using maintenance or repair tools on production systems.

## Sensitive Output

Hostnames, usernames, IP addresses, mount points, hardware identifiers, and installed software lists may be sensitive. Review and redact reports before sharing them.
