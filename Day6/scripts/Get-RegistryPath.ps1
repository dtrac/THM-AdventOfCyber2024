function RegistryCheck {
    # Define the registry path and value name
    $registryPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion"
    $valueName = "ProgramFilesDir"

    # Query the registry using Get-ItemProperty
    try {
        $registryValue = Get-ItemProperty -Path $registryPath -Name $valueName
        Write-Host "Registry query executed successfully."
        Write-Host "Value of $valueName: $($registryValue.$valueName)"
    } catch {
        Write-Error "Failed to execute registry query. Error: $_"
    }
}

# Main Logic
RegistryCheck
