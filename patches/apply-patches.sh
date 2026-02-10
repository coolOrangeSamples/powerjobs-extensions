#!/bin/bash
#
# Script to apply README documentation patches to version branches
#

set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
REPO_DIR=$(cd "$SCRIPT_DIR/.." && pwd)

cd "$REPO_DIR"

echo "================================================"
echo "Applying README Updates to Version Branches"
echo "================================================"
echo ""

# Store current branch
CURRENT_BRANCH=$(git branch --show-current)
echo "Current branch: $CURRENT_BRANCH"
echo ""

# Define branches and their patch directories
declare -A BRANCHES
BRANCHES[2024-version]="patches/2024"
BRANCHES[2025-version]="patches/2025"
BRANCHES[2026-Version]="patches/2026"

SUCCESS_COUNT=0
FAILED_BRANCHES=()

# Apply patches to each branch
for BRANCH in "${!BRANCHES[@]}"; do
    PATCH_DIR="${BRANCHES[$BRANCH]}"
    PATCH_FILE="$PATCH_DIR/0001-Update-MsOffice-ReadMe-with-zip-file-installation-in.patch"
    
    echo "-------------------------------------------"
    echo "Processing branch: $BRANCH"
    echo "-------------------------------------------"
    
    # Check if patch file exists
    if [ ! -f "$PATCH_FILE" ]; then
        echo "❌ ERROR: Patch file not found: $PATCH_FILE"
        FAILED_BRANCHES+=("$BRANCH (patch not found)")
        continue
    fi
    
    # Checkout the branch
    echo "Checking out branch $BRANCH..."
    if ! git checkout "$BRANCH" 2>&1; then
        echo "❌ ERROR: Failed to checkout branch $BRANCH"
        FAILED_BRANCHES+=("$BRANCH (checkout failed)")
        continue
    fi
    
    # Apply the patch
    echo "Applying patch..."
    if git am "$PATCH_FILE"; then
        echo "✅ Successfully applied patch to $BRANCH"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
        echo ""
        echo "To push this change, run:"
        echo "  git push origin $BRANCH"
        echo ""
    else
        echo "❌ ERROR: Failed to apply patch to $BRANCH"
        # Abort the failed am operation
        git am --abort 2>/dev/null || true
        FAILED_BRANCHES+=("$BRANCH (patch apply failed)")
    fi
done

# Return to original branch
echo "-------------------------------------------"
echo "Returning to original branch: $CURRENT_BRANCH"
git checkout "$CURRENT_BRANCH"

echo ""
echo "================================================"
echo "Summary"
echo "================================================"
echo "Successfully updated: $SUCCESS_COUNT branch(es)"

if [ ${#FAILED_BRANCHES[@]} -gt 0 ]; then
    echo "Failed branches:"
    for FAILED in "${FAILED_BRANCHES[@]}"; do
        echo "  - $FAILED"
    done
    exit 1
fi

echo ""
echo "✅ All patches applied successfully!"
echo ""
echo "To push all changes at once, run:"
echo "  git push origin 2024-version 2025-version 2026-Version"
echo ""
echo "Or push individually:"
echo "  git push origin 2024-version"
echo "  git push origin 2025-version"
echo "  git push origin 2026-Version"
