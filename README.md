# Temp & Cache Cleaner

A Windows batch script that automates the cleanup of temporary files and npm cache to free up disk space and maintain system performance.

## Features

- Removes temporary files from the system temp directory
- Calculates and displays the amount of space freed
- Clears npm cache (when npm is available)
- Provides step-by-step progress information

## Usage

Run the script as administrator for optimal results:

```batch
temp_delete.bat
```

## What It Does

1. **Analyzes** the temp folder to determine initial size
2. **Cleans** all files in the temp directory and removes subdirectories
3. **Clears** npm cache (if npm is installed and accessible)
4. **Reports** the amount of space freed during the process

## Notes

- Some files may be skipped if they are currently in use by running programs
- Administrator privileges may be required for complete cleanup
- The script is designed for Windows environments