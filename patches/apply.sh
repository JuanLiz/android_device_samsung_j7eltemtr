#!/bin/bash
#
# Applies the platform patches j7eltemtr needs on top of a synced
# LineageOS-Revived 20.0 tree. Run it from the top of the tree after every
# `repo sync`; each patched project gets a `j7eltemtr-patches` branch
# recreated from the manifest revision, so the script can be run again.
#
# Usage: device/samsung/j7eltemtr/patches/apply.sh [manifest branch]

set -e

TOP=$(pwd)
DIR=$(cd "$(dirname "$0")" && pwd)
MANIFEST_BRANCH=${1:-lineage-20.0}
BRANCH=j7eltemtr-patches

if [ ! -d "$TOP/.repo" ]; then
    echo "Run this script from the top of the tree" >&2
    exit 1
fi

for patchdir in $(find "$DIR" -name '*.patch' -printf '%h\n' | sort -u); do
    project=${patchdir#"$DIR"/}
    if [ ! -d "$TOP/$project/.git" ] && [ ! -f "$TOP/$project/.git" ]; then
        echo "$project: not in the tree" >&2
        exit 1
    fi
    base=$(git -C "$TOP/$project" rev-parse --verify -q "m/$MANIFEST_BRANCH" || true)
    if [ -z "$base" ]; then
        echo "$project: no manifest revision m/$MANIFEST_BRANCH, run repo sync first" >&2
        exit 1
    fi
    echo "== $project"
    git -C "$TOP/$project" checkout -q -B "$BRANCH" "$base"
    git -C "$TOP/$project" am -q --3way "$patchdir"/*.patch
done
