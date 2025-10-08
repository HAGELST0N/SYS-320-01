<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}

function checkPassword($password){
    if($password.length -lt 6){
        #write-host "length"
        return $false
    }
    if($password -notmatch '[a-z]' ){
        #write-host "a-z"
        return $false
     }

    if($password -notmatch '[0-9]' ){
        #write-host "0-9"
        return $false
    }

    if($password -notmatch '[^a-z0-9]' ){
        #write-host "special"
        return $false
    }
    return $true
}
<#
checkPassword("88a8+")
checkPassword("88888-")
checkPassword("ahsdfhd+")
checkPassword("8huisdnfo89")
checkPassword("P@ssw0rd")
#>