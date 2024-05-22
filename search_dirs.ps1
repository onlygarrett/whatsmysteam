Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# little output
Write-Host "";
Write-Host "Here are the games you have currently installed:" -ForegroundColor Green;
Write-Host "-----------------------------------------------" -ForegroundColor Green;

# Grab steam install path via registry key
$REG_TREE_PATH = 'HKCU:\Software\Valve\';
$steamPath = Get-ChildItem -Path $REG_TREE_PATH | Get-ItemProperty | Select-Object -Property "*SteamPath" | Where-Object { $_.SteamPath } | Select-Object -ExpandProperty "SteamPath";

# Output folders
Get-ChildItem "$steamPath\steamapps\common\" | Select-Object -ExpandProperty "Name";
