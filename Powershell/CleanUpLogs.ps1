$folderPath = "D:\Loging"
$days = 1
$currentDate = Get-Date
$limit = $currentDate.AddDays(-$days)
Get-ChildItem -Path $folderPath -Recurse | Where-Object { !$_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item -Force

$folderPath = "C:\inetpub\logs\LogFiles"
$days = 10
$currentDate = Get-Date
$limit = $currentDate.AddDays(-$days)
Get-ChildItem -Path $folderPath -Recurse | Where-Object { !$_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item -Force


$folderPath = "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\LOGS"
$days = 5
$currentDate = Get-Date
$limit = $currentDate.AddDays(-$days)
Get-ChildItem -Path $folderPath -Recurse | Where-Object { !$_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item -Force
