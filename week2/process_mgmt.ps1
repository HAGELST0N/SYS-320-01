<#
cd C:/
#Find processes beginning with "C" and list them
Get-Process -Name "C*"
#Find processes not in
Get-Process | Where-Object {$_.Path -ne "*system32*"}

cd $PSScriptRoot
Get-Service | Where-Object {$_.Status -eq "Stopped"} | sort | `
Export-Csv -Path "*outfolder/stopped_process.csv"
#>
$chrome = Get-Process chrome
if ($chrome)
{$chrome | kill}
else{
Start-Process "chrome.exe" "https://www.champlain.edu"
}