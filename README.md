# PowerScan
A windows machine based Powershell CVE Scanner

## Overview

This script is designed to check files on a Windows machine against Common Vulnerabilities and Exposures (CVEs) listed in a zipped folder. It performs detailed logging for each file that matches a CVE, providing comprehensive documentation including file attributes and metadata.

## Instructions

1. **Download the zipped CVE reference files:**
   - [Download zipped CVE Files](https://github.com/CVEProject/cvelistV5/archive/refs/heads/main.zip)
   - - Place the downloaded zip file in your Downloads folder.

3. **Extract the CVE Files:**
   - After downloading the zipped folder, extract its contents to the "downloads" directory on your machine.

4. **Prepare Files to Check:**
   - Ensure that the files you want to check against the CVEs are stored in the "C:\" directory on your machine.

5. **Run the Script:**
   - Open PowerShell as an administrator.
   - Navigate to the directory where you saved the script.
   - Run the script by typing `.\powerscan.ps1` and pressing Enter.

6. **View Detailed Logs:**
   - After running the script, you can find detailed logs in a file named `detailed_logs.txt` in the same directory where you ran the script.

## Detailed Breakdown

- **CVE Files:**
  - The zipped folder contains a collection of directories, each representing a specific CVE. Each CVE directory contains files related to that CVE.

- **Script Execution:**
  - The script extracts the contents of the zipped folder containing the CVEs to a specified directory on the machine.
  - It then iterates through each CVE directory.
  - For each CVE, the script checks the files on the machine against that CVE.
  - If a file matches a CVE, detailed information about the file is logged, including date and time, CVE, file name, file path, file location, creation date, last modified date, author/owner, and accounts created under/owned by the file.

## Notes

- The zip file containing the CVEs is quite large and will take quite some time to unpack and thus the initial scan may take quite some time to complete.
- The powershell execution policy should be set to allow you to run this script prior to running the script.

## Developer Credits

- The powerscan program was formulated by Hello Security LLC

