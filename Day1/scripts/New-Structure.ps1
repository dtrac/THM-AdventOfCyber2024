param (
    [Parameter(Mandatory = $true)]
    [string]$BaseDirectory
)

# Ensure the base directory exists
if (-not (Test-Path $BaseDirectory)) {
    New-Item -Path $BaseDirectory -ItemType Directory | Out-Null
}

# Loop through numbers 1 to 24 using the range operator
1..24 | ForEach-Object {
    $folderName = "Day$_"
    $folderPath = Join-Path -Path $BaseDirectory -ChildPath $folderName

    # Create the folder if it doesn't exist
    if (-not (Test-Path $folderPath)) {
        New-Item -Path $folderPath -ItemType Directory | Out-Null
    }

    # Create Notes.md file inside the folder
    $notesFilePath = Join-Path -Path $folderPath -ChildPath "Notes.md"
    if (-not (Test-Path $notesFilePath)) {
        Set-Content -Path $notesFilePath -Value "# Notes for $folderName" -Encoding UTF8
    }
}

Write-Host "Folder structure with Notes.md files created successfully in $BaseDirectory."
