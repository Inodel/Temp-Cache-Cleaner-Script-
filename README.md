# Temp & Cache Cleaner

A simple Windows batch script that helps free up disk space by cleaning temporary files and clearing npm cache.

## What it does

This script will:
- Clean your system's temporary files directory
- Show you how much space was freed
- Clear npm cache if you have Node.js installed

## How to use

Just run the batch file as administrator for best results:

```
temp_script.bat
```

The script will walk you through the cleanup process step by step.

## Notes

- Some files might not get deleted if they're currently in use
- Running as administrator gives the script better access to delete files
- Works on Windows systems