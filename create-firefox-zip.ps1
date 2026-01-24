# Create Firefox extension ZIP with Unix-style paths (forward slashes)
# Required by Mozilla Add-ons validation

Add-Type -Assembly System.IO.Compression.FileSystem

$sourceDir = "C:\Users\bgibs\Development\sip-startpage"
$zipPath = "C:\Users\bgibs\Development\sip-startpage\sip-v1.5.1-firefox.zip"

# Remove old ZIP if exists
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

# Create new ZIP
$zip = [System.IO.Compression.ZipFile]::Open($zipPath, 'Create')

# Files to include at root level
$rootFiles = @(
    'index.html',
    'manifest.json',
    'script.js',
    'style.css',
    'PRIVACY.md'
)

# Add root files
foreach ($file in $rootFiles) {
    $fullPath = Join-Path $sourceDir $file
    if (Test-Path $fullPath) {
        $entryName = $file  # Use Unix-style forward slashes (already is for single files)
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $fullPath, $entryName) | Out-Null
        Write-Host "Added: $entryName"
    }
}

# Add icons (only PNG files)
$iconFiles = @('icon16.png', 'icon32.png', 'icon48.png', 'icon128.png')
foreach ($file in $iconFiles) {
    $fullPath = Join-Path $sourceDir "icons\$file"
    if (Test-Path $fullPath) {
        $entryName = "icons/$file"  # Use forward slash
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $fullPath, $entryName) | Out-Null
        Write-Host "Added: $entryName"
    }
}

# Add fonts directory
$fontsDir = Join-Path $sourceDir "fonts"
if (Test-Path $fontsDir) {
    Get-ChildItem -Path $fontsDir -Recurse -File | ForEach-Object {
        $relativePath = $_.FullName.Substring($sourceDir.Length + 1)
        $entryName = $relativePath -replace '\\', '/'  # Convert backslashes to forward slashes
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $_.FullName, $entryName) | Out-Null
        Write-Host "Added: $entryName"
    }
}

# Add assets directory
$assetsDir = Join-Path $sourceDir "assets"
if (Test-Path $assetsDir) {
    Get-ChildItem -Path $assetsDir -Recurse -File | ForEach-Object {
        $relativePath = $_.FullName.Substring($sourceDir.Length + 1)
        $entryName = $relativePath -replace '\\', '/'  # Convert backslashes to forward slashes
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $_.FullName, $entryName) | Out-Null
        Write-Host "Added: $entryName"
    }
}

# Close the ZIP
$zip.Dispose()

Write-Host "`nZIP file created successfully: $zipPath"
Get-Item $zipPath | Select-Object Name, Length, LastWriteTime
