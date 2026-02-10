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

# Create temp directory for patches if needed
TEMP_PATCH_DIR="/tmp/powerjobs-patches-$$"
mkdir -p "$TEMP_PATCH_DIR"

# Extract patches from the copilot branch to temp directory
echo "Extracting patches from copilot/update-microsoft-office-docs branch..."
git show copilot/update-microsoft-office-docs:patches/2024/0001-Update-MsOffice-ReadMe-with-zip-file-installation-in.patch > "$TEMP_PATCH_DIR/2024.patch"
git show copilot/update-microsoft-office-docs:patches/2025/0001-Update-MsOffice-ReadMe-with-zip-file-installation-in.patch > "$TEMP_PATCH_DIR/2025.patch"
git show copilot/update-microsoft-office-docs:patches/2026/0001-Update-MsOffice-ReadMe-with-zip-file-installation-in.patch > "$TEMP_PATCH_DIR/2026.patch"
echo "✅ Patches extracted to $TEMP_PATCH_DIR"
echo ""

# Define branches and their patch files
declare -A BRANCHES
BRANCHES[2024-version]="$TEMP_PATCH_DIR/2024.patch"
BRANCHES[2025-version]="$TEMP_PATCH_DIR/2025.patch"
BRANCHES[2026-Version]="$TEMP_PATCH_DIR/2026.patch"

SUCCESS_COUNT=0
FAILED_BRANCHES=()

# Apply patches to each branch
for BRANCH in "${!BRANCHES[@]}"; do
    PATCH_FILE="${BRANCHES[$BRANCH]}"
    
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

# Clean up temp directory
rm -rf "$TEMP_PATCH_DIR"

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
