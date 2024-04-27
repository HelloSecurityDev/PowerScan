# Script to check machine files against CVEs and perform detailed logging

# Path to the ZIP file containing CVEs
$zipFilePath = "$env:USERPROFILE\Downloads\cvelistV5-main.zip"

# Destination directory to extract CVEs
$extractPath = "C:\CVEs"

# Extract the contents of the ZIP file
Expand-Archive -Path $zipFilePath -DestinationPath $extractPath -Force

# Function to check machine files against CVEs and perform logging
function CheckFilesAgainstCVEs {
    param (
        [string]$cve
    )

    # Path to the directory containing files to check
    $filesDirectory = "C:\FilesToCheck"

    # Get files matching the CVE
    $files = Get-ChildItem -Path $filesDirectory -Recurse | Where-Object { $_.Name -match $cve }

    # If files matching the CVE are found
    if ($files) {
        foreach ($file in $files) {
            # Log detailed information about the file
            $logEntry = @"
Date and Time: $(Get-Date)
CVE: $cve
File Name: $($file.Name)
File Path: $($file.FullName)
File Location: $($file.DirectoryName)
Creation Date: $($file.CreationTime)
Last Modified Date: $($file.LastWriteTime)
Author/Owner: $($file.GetAccessControl().Owner)
Accounts Created Under: <Accounts created under the file, if available>
Owned By: <Accounts with ownership of the file, if available>
"@
            # Append log entry to log file
            Add-Content -Path "detailed_logs.txt" -Value $logEntry
        }
    }
}

# Loop through each folder representing a CVE
$folders = Get-ChildItem -Path $extractPath -Directory
foreach ($folder in $folders) {
    $cve = $folder.Name
    # Check files against the CVE and perform detailed logging
    CheckFilesAgainstCVEs -cve $cve
}
