cd $PSScriptRoot
$files = (dir -File)
for($j = 0; $j -le $files.Count; $j++){
    if ($files[$j].Name -ilike "*ps1"){
        Write-Host $files[$j].Name
    }
}

$folderpath = "$PSScriptRoot/outfolder"
if(Test-Path $folderpath){Write-Host "Folder already exists."}
else{New-Item -ItemType Directory -Path $folderpath}


cd $PSScriptRoot
$files = (dir -File)

$folderpath = "outfolder/"
$filepath = join-path -Path $folderpath "out.csv"

$files | Where-Object{$_.Extension -eq ".ps1"} |`
Export-Csv -Path $filePath

$files = Get-ChildItem -Path . -Recurse -File
$files | Rename-Item -NewName {$_.Name -replace ".csv", ".log"}

Get-ChildItem -Path . -Recurse -File