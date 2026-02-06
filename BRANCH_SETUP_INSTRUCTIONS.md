# How to Complete the Branch Setup

## Current Status

Three version-specific branches have been created locally:
- `version-2024` (commit: 0a1ddc7)
- `version-2025` (commit: 29a4edb)
- `version-2026` (commit: b90c69b)

These branches are ready but need to be pushed to the remote repository.

## Required Actions

### 1. Push the branches to remote

Run the provided helper script:
```bash
./push-version-branches.sh
```

Or push manually:
```bash
git push origin version-2024
git push origin version-2025
git push origin version-2026
```

### 2. Verify the branches

After pushing, verify the branches exist on GitHub:
```bash
git branch -r | grep version-
```

You should see:
```
origin/version-2024
origin/version-2025
origin/version-2026
```

### 3. Set up branch protection (Optional)

If desired, set up branch protection rules for these version branches to prevent accidental modifications.

## Testing the Branches

To test each version:

```bash
# Test 2024 version
git checkout version-2024
cd MsOffice
# Build and test

# Test 2025 version
git checkout version-2025
cd MsOffice
# Build and test

# Test 2026 version
git checkout version-2026
cd MsOffice
# Build and test
```

## Branch Differences

Each branch differs only in:
1. The `<HintPath>` in `MsOffice/MsOfficeApplication/MsOfficeApplication.csproj`
2. The absence of `MsOffice/MsOfficeApplication/powerJobs.Common.dll` (which was removed)

All other files remain identical across branches.
