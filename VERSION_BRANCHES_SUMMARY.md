# Version-Specific Branches Summary

This document describes the version-specific branches created for the MsOffice project.

## Overview

Three new branches have been created to support different versions of powerJobs.Common:

- **version-2024**: References `References/2024/powerJobs.Common.dll`
- **version-2025**: References `References/2025/powerJobs.Common.dll`
- **version-2026**: References `References/2026/powerJobs.Common.dll`

## Changes Made

For each branch, the following changes were implemented:

1. Updated `MsOffice/MsOfficeApplication/MsOfficeApplication.csproj`:
   - Changed the `<HintPath>` for `powerJobs.Common` reference
   - From: `.\powerJobs.Common.dll` (local copy)
   - To: `..\..\References\[YEAR]\powerJobs.Common.dll` (version-specific reference)

2. Removed the local copy of `powerJobs.Common.dll` from `MsOffice/MsOfficeApplication/` folder

## Branch Details

### version-2024
- **Commit**: 0a1ddc7
- **Reference Path**: `..\..\References\2024\powerJobs.Common.dll`

### version-2025
- **Commit**: 29a4edb
- **Reference Path**: `..\..\References\2025\powerJobs.Common.dll`

### version-2026
- **Commit**: b90c69b
- **Reference Path**: `..\..\References\2026\powerJobs.Common.dll`

## Verification

Each branch has been verified to:
1. Reference the correct version-specific DLL path
2. Have the local DLL removed
3. Maintain all other project settings unchanged

## Usage

To work with a specific version:

```bash
# For 2024 version
git checkout version-2024

# For 2025 version
git checkout version-2025

# For 2026 version
git checkout version-2026
```

## Pushing Branches to Remote

The three version-specific branches have been created locally and need to be pushed to the remote repository. 

### Option 1: Use the helper script
```bash
./push-version-branches.sh
```

### Option 2: Push manually
```bash
git push origin version-2024
git push origin version-2025
git push origin version-2026
```

## Notes

- This implementation was done for MsOffice only, as specified in the requirements
- The existing References folder structure with version-specific subdirectories was already in place
- Each branch maintains minimal changes - only the reference path and removal of the local DLL
- The branches are created locally and documented here. They need to be pushed by someone with appropriate repository access.
