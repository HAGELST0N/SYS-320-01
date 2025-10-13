#function declaration is not werking well﻿ without this commented line idk why
function getLoginOuts($days){

$loginouts = get-EventLog system -source Microsoft-Windows-Winlogon -after (Get-Date).AddDays(-$days)
$loginoutsTable = @()
for($i = 0; $i -lt $loginouts.Count; $i++){
$event = ""
if($loginouts[$i].EventID -eq '7001'){$event = "logon"}
if($loginouts[$i].EventID -eq '7002'){$event = "logout"}

$user = $loginouts[$i].ReplacementStrings[1]
$userObject = New-Object System.Security.Principal.SecurityIdentifier($user)
$user = $userObject.Translate([System.Security.Principal.NTAccount])
$loginoutsTable += [pscustomobject] @{"Time" = $loginouts[$i].TimeGenerated;
                                      "Id" = $loginouts[$i].EventID;
                                      "Event" = $event;
                                      "User" = $user;
                                      }
}
return $loginoutsTable
}

function getBootShutdown($days){

$bootshutdown = get-EventLog system -source EventLog -after (Get-Date).AddDays(-$days) | where-object{$_.EventID -ilike "600[56]"}
$bootshutdownTable = @()
$bootshutdown | ForEach-Object{
$event = ""
if($_.EventID -eq "6005"){
$user = "system"
$event = "startup"
#$user = $_.ReplacementStrings[1]
$_.ReplacementStrings
#$userObject = New-Object System.Security.Principal.SecurityIdentifier($user)
#$username = $userObject.Translate([System.Security.Principal.NTAccount])
#$user = $username.Value
}
elseif($_.EventID -eq "6006"){
$event = "shutdown"
$user = "system"
}


$bootshutdownTable += [pscustomobject] @{"Time" = $_.TimeGenerated;
                                      "Id" = $_.EventID;
                                      "Event" = $event;
                                      "User" = $user;
                                      }
}
return $bootshutdownTable
}
