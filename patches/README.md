# README: Applying Documentation Updates to Version Branches

This directory contains patch files for updating the MsOffice/ReadMe.md documentation across the version branches (2024-version, 2025-version, and 2026-Version).

## Current Status

✅ **Patches have been created and tested successfully**

The patches have been:
- ✅ Generated from the master branch changes
- ✅ Tested and verified to apply cleanly  
- ✅ Ready to be pushed to the remote repository

## Background

The MsOffice ReadMe.md file on the master branch has been updated to:
- Change the installation instructions from using an installer to downloading and extracting a zip file from the [release page](https://github.com/coolOrangeLabs/powerjobs-extensions/releases)
- Add a link to the release page
- Update the "Upgrade the powerJobs extension" section to list the three version branches
- Improve the build instructions formatting
- Remove references to the WiX toolset from prerequisites

These same changes need to be applied to the three version branches.

## Patch Files

This directory contains patches for each version branch:
- `patches/2024/` - Patch for the 2024-version branch
- `patches/2025/` - Patch for the 2025-version branch
- `patches/2026/` - Patch for the 2026-Version branch

## How to Apply the Patches

### Option 1: Automatic Application (Recommended)

Run the provided script from the repository root:

```bash
chmod +x patches/apply-patches.sh
./patches/apply-patches.sh
```

This script will:
1. Extract patches from the git history
2. Reset each local branch to match the remote (ensuring a clean state)
3. Check if patches are already applied (to avoid duplicate application)
4. Apply each patch to its respective branch
5. Show you the changes made
6. Provide commands to push the changes

**Note:** The script automatically resets local branches to match their remote counterparts before applying patches. This ensures patches apply cleanly even if you have local commits. If you have uncommitted changes, stash them first with `git stash`.

After running the script, push the changes:
```bash
git push origin 2024-version 2025-version 2026-Version
```

### Option 2: Manual Application

To manually apply the patches:

#### For 2024-version branch:
```bash
git checkout 2024-version
git show copilot/update-microsoft-office-docs:patches/2024/0001-Update-MsOffice-ReadMe-with-zip-file-installation-in.patch | git am
git push origin 2024-version
```

#### For 2025-version branch:
```bash
git checkout 2025-version
git show copilot/update-microsoft-office-docs:patches/2025/0001-Update-MsOffice-ReadMe-with-zip-file-installation-in.patch | git am
git push origin 2025-version
```

#### For 2026-Version branch:
```bash
git checkout 2026-Version
git show copilot/update-microsoft-office-docs:patches/2026/0001-Update-MsOffice-ReadMe-with-zip-file-installation-in.patch | git am
git push origin 2026-Version
```

## Changes Made

The patches update the following sections in MsOffice/ReadMe.md:

### Installation Section
**Before:**
```
Use the installer found in the release page and follow the instructions. After the installation is complete, you will find 
- New job "Sample.MsOffice.CreatePDF.ps1" added to the Jobs folder. 
- New module 'MsOfficeLoad.psm1' added to the modules folder 
- New custom powerJobs application 'MsOfficeApplication.dll' in the subfolder 'MsOfficeSupport' under the modules folder.
```

**After:**
```
Download the zip file from the [release page](https://github.com/coolOrangeLabs/powerjobs-extensions/releases) and extract its contents. After extracting, you will find:
- A new job "Sample.MsOffice.CreatePDF.ps1" in the Jobs folder.
- A new custom powerJobs application 'coolorange.MsOffice.dll' in the subfolder 'MsOffice' under the modules folder.
- A new module 'register-MsOffice-application.psm1' in the modules folder.

Follow the instructions provided in the release notes to complete the setup.
```

### Upgrade Section
- Added clear documentation about the three version branches (2024-version, 2025-version, 2026-version)
- Removed WiX toolset from prerequisites
- Improved formatting with numbered steps
- Added "Output Files" section with clear instructions on where to copy files

## Verification

After applying the patches, verify that:
1. The Installation section includes the link to the release page
2. The installation mentions downloading a zip file (not an installer)
3. The Upgrade section lists the three version branches
4. File names match the new structure (e.g., coolorange.MsOffice.dll, not MsOfficeApplication.dll)

## Testing

The patches have been tested locally and successfully applied to all three version branches. They apply cleanly without conflicts and make only the necessary documentation changes.

## Notes

- These patches are idempotent - they can be safely applied even if some changes already exist
- The patches were generated from commits that update only the MsOffice/ReadMe.md file
- Each patch has been tested and verified to apply cleanly to its respective branch
- The script automatically extracts patches from the git history, so it works from any branch
