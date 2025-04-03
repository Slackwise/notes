---
date: 2025-04-03
published: false
categories: notes
tags:
  - untagged
---

Windows
===================

### Troubleshooting

#### Reset Windows Update (if stuck)

```powershell
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true

$wuauserv = Get-WmiObject Win32_Service | Where-Object { $_.Name -eq "wuauserv" }
if ($wuauserv -and $service.ProcessId -ne 0) {
    Write-Output "Forcibly stopping Windows Update Service $(wuauserv.ProcessId)..."
    Stop-Process -Id $service.ProcessId -Force
    Write-Output "WUAUSERV process stopped."
} else {
    Write-Output "WUAUSERV not found or not running."
}

# Alternatively, you can find the service PID via `sc queryex wuauserv`

net stop wuauserv
net stop bits

rm -rf C:\Windows\SoftwareDistribution\*

net start wuauserv
net start bits
```