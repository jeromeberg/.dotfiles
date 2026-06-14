#!/bin/bash
set -euo pipefail

source "${HOME}/.dotfiles/.config/tools/restic/env.sh"

notifications_enabled=0

# == MacOS notifications == #
if [[ "$(uname -s)" == "Darwin" ]] && command -v /usr/bin/osascript >/dev/null 2>&1; then
    notifications_enabled=1
fi

notify() {
    if [[ "$notifications_enabled" -ne 1 ]]; then
        return 0
    fi

    /usr/bin/osascript \
        -e 'on run argv' \
        -e 'display notification (item 1 of argv) with title "Restic Backup"' \
        -e 'end run' \
        "$1"
}

skipped=0

on_exit() {
    exit_code=$?
    if [[ "$skipped" -eq 1 ]]; then
        notify "Skipped: repo is not accessible."
    elif [[ "$exit_code" -eq 0 ]]; then
        notify "Backup completed successfully."
    else
        notify "Backup failed (code $exit_code). Check /tmp/restic.log."
    fi
}

trap on_exit EXIT

notify "Backup started."

# == END MACOS == #

# drive not mounted
if [[ ! -d "$RESTIC_REPOSITORY" ]]; then
    echo "$(date): Restic not accessible at $RESTIC_REPOSITORY, skipping." >&2
    skipped=1
    exit 0
fi

restic backup \
    --verbose \
    ~/Documents

restic forget \
    --keep-daily 7 \
    --keep-weekly 4 \
    --keep-monthly 12 \
    --prune
