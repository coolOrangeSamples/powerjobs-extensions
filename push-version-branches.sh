#!/bin/bash
# Script to push version-specific branches to remote repository
# This script should be run manually by someone with push access

echo "Pushing version-specific branches to remote..."

# Push version-2024 branch
git push origin version-2024
if [ $? -eq 0 ]; then
    echo "✓ Successfully pushed version-2024 branch"
else
    echo "✗ Failed to push version-2024 branch"
fi

# Push version-2025 branch
git push origin version-2025
if [ $? -eq 0 ]; then
    echo "✓ Successfully pushed version-2025 branch"
else
    echo "✗ Failed to push version-2025 branch"
fi

# Push version-2026 branch
git push origin version-2026
if [ $? -eq 0 ]; then
    echo "✓ Successfully pushed version-2026 branch"
else
    echo "✗ Failed to push version-2026 branch"
fi

echo ""
echo "Branch push complete!"
echo "You can now switch between versions using:"
echo "  git checkout version-2024"
echo "  git checkout version-2025"
echo "  git checkout version-2026"
