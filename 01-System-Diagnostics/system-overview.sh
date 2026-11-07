#!/usr/bin/env bash
#
# system-overview.sh
# Read-only overview of basic Linux system information.
#
# Requirements: Bash 4+ recommended; standard Linux procfs and core utilities.
# No root privileges required. No network requests. No system changes.

set -u

section() {
    printf '\n=== %s ===\n' "$1"
}

have() {
    command -v "$1" >/dev/null 2>&1
}

section "Operating system"
if [[ -r /etc/os-release ]]; then
    # shellcheck disable=SC1091
    . /etc/os-release
    printf 'Distribution: %s\n' "${PRETTY_NAME:-Unknown}"
else
    printf 'Distribution: Unknown (/etc/os-release unavailable)\n'
fi
printf 'Kernel: %s\n' "$(uname -srmo 2>/dev/null || uname -a)"
printf 'Hostname: %s\n' "$(hostname 2>/dev/null || printf 'Unavailable')"

section "Uptime"
if have uptime; then
    uptime -p 2>/dev/null || uptime
else
    printf 'Uptime command unavailable.\n'
fi

section "CPU"
if [[ -r /proc/cpuinfo ]]; then
    cpu_model="$(awk -F: '/^model name[[:space:]]*:/ {gsub(/^[[:space:]]+/, "", $2); print $2; exit}' /proc/cpuinfo)"
    cpu_count="$(grep -c '^processor[[:space:]]*:' /proc/cpuinfo 2>/dev/null || true)"
    printf 'Model: %s\n' "${cpu_model:-Unavailable}"
    printf 'Logical processors: %s\n' "${cpu_count:-Unavailable}"
else
    printf '/proc/cpuinfo unavailable.\n'
fi

section "Memory"
if [[ -r /proc/meminfo ]]; then
    awk '
        /^MemTotal:/     { total=$2 }
        /^MemAvailable:/ { available=$2 }
        END {
            if (total > 0) {
                printf "Total: %.2f GiB\n", total/1024/1024
                if (available > 0)
                    printf "Available: %.2f GiB\n", available/1024/1024
            } else {
                print "Memory information unavailable."
            }
        }
    ' /proc/meminfo
else
    printf '/proc/meminfo unavailable.\n'
fi

section "Filesystems"
if have df; then
    df -hT -x tmpfs -x devtmpfs 2>/dev/null || df -h
else
    printf 'df command unavailable.\n'
fi

section "Network addresses"
if have ip; then
    ip -brief address show 2>/dev/null || ip address show
elif have hostname; then
    hostname -I 2>/dev/null || printf 'Could not retrieve IP addresses.\n'
else
    printf 'Neither ip nor hostname command is available.\n'
fi

printf '\nCompleted. This script only reads local system information.\n'
