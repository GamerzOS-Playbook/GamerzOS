$windir = [Environment]::GetFolderPath('Windows')

# Add GamerzOS' PowerShell modules
$env:PSModulePath += ";$windir\GamerzOSModules\Scripts\Modules"