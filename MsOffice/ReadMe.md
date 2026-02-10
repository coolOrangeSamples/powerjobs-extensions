[![Windows](https://img.shields.io/badge/Platform-Windows-lightgray.svg)](https://www.microsoft.com/en-us/windows/)
[![PowerShell](https://img.shields.io/badge/PowerShell-5-blue.svg)](https://microsoft.com/PowerShell/)
[![Vault](https://img.shields.io/badge/Autodesk%20Vault-2023-yellow.svg)](https://www.autodesk.com/products/vault/)
[![powerJobs](https://img.shields.io/badge/coolOrange%20powerJobs-23-orange.svg)](https://www.coolorange.com/en-eu/enhance.html#powerJobs)

## Disclaimer
THE SAMPLE CODE ON THIS REPOSITORY IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.
THE USAGE OF THIS SAMPLE IS AT YOUR OWN RISK AND **THERE IS NO SUPPORT** RELATED TO IT.

# MsOffice-PowerJobs-Extension
Custom powerJobs extension to export PDFs from Microsoft Office Applications - Word, Excel, PowerPoint.
### Getting Started
This is a custom powerJobs application which supports exporting PDFs from Microsoft Office Applications - Word, Excel, PowerPoint. 
#### Prerequisite
Following applications are required for running this job:
-   Microsoft Office (Either Word or Excel or PowerPoint or all of the above depending on the requirements)
-   powerJobs 2022 stream (v22.0.20 and above)

#### Installation
Download the zip file from the [release page](https://github.com/coolOrangeLabs/powerjobs-extensions/releases) and extract its contents. After extracting, you will find:
- A new job "Sample.MsOffice.CreatePDF.ps1" in the Jobs folder.
- A new custom powerJobs application 'coolorange.MsOffice.dll' in the subfolder 'MsOffice' under the modules folder.
- A new module 'register-MsOffice-application.psm1' in the modules folder.

Follow the instructions provided in the release notes to complete the setup.

#### Setting and running the job
Rename the installed sample jobs so that your job can be identified as custom job and will not be overwritten by future updates. You can modify this copied job as you please.

Depending on the needs, the job can be triggered to run automatically during lifecycle state change or in some other ways.
Further information on how to setup and run the job on lifecycle state change can be found on [powerJob's Getting Started documentation](https://doc.coolorange.com/projects/coolorange-powerjobsprocessordocs/en/stable/getting_started.html#how-to-embed-the-job-in-a-status-change)

### Upgrade the powerJobs extension
The powerJobs extension currently supports three streams, each maintained in their respective branches:
- **2024-version**: Compatible with powerJobs 2024 versions.
- **2025-version**: Compatible with powerJobs 2025 versions.
- **2026-version**: Compatible with powerJobs 2026 versions.

For newer powerJobs versions, you will need to build and compile this solution. Follow the steps below to upgrade the powerJobs extension to support newer powerJobs versions.

#### Prerequisite
- Install or upgrade powerJobs Processor on your development machine.
- Clone this repository and create a new branch from the master e.g. 2027-version.
- Install Visual Studio with the required .NET development tools.

#### Build Solution
1. Open the Visual Studio solution located under the [MsOffice](/MsOffice) folder.
2. In Visual Studio, right-click on `References` and select **Add References**.
3. Search for the assembly `powerJobs.Common` in the **Assemblies** tab and add it to your project.  
   ![Add Reference](https://doc.coolorange.com/projects/coolorange-powerjobsprocessordocs/en/stable/_images/vs_add_reference.png)
4. Replace the `UpgradeCode` with the existing GUID found in [ProductVariables.wxi](https://github.com/coolOrangeLabs/powerjobs-extensions/blob/0973f254b52c9e85c144df1a9ffe39e794c08aa0/MsOffice/Installer/Includes/ProductVariables.wxi#L3).
5. Build the solution.

#### Output Files
After building the solution, the following file will be generated:
- **coolorange.MsOffice.dll**: The custom powerJobs application.

To complete the setup, copy the following files from the source repository:
- **coolorange.MsOffice.dll**: Place this file in the `MsOffice` subfolder under the `modules` folder.
- **register-MsOffice-application.psm1**: Copy this file to the `modules` folder.
- **Sample.MsOffice.CreatePDF.ps1**: Copy the sample job script from the `Jobs` folder to your `Jobs` directory.

Further information on how to create custom applications for powerJobs can be found in the [powerJobs documentation](https://doc.coolorange.com/projects/coolorange-powerjobsprocessordocs/en/stable/jobprocessor/applications.html#custom-applications).

## At your own risk
The usage of these samples is at your own risk. There is no free support related to the samples. However, if you have questions about powerJobs, then visit http://www.coolorange.com/wiki or start a conversation in our support forum at http://support.coolorange.com/support/discussions.

## Author
coolOrange S.r.l.

<img src="https://i.ibb.co/NmnmjDT/Logo-CO-Full-colore-RGB-short-Payoff.png" width="250">