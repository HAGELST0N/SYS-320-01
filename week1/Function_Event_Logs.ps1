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

$bootshutdown = get-EventLog system -source EventLog -after (Get-Date).AddDays(-$days) | where{$_.EventID -ilike "600[56]"} 

$bootshutdownTable = @()
for($i = 0; $i -lt $bootshutdown.Count; $i++){

$event = ""
if($bootshudown[$i].EventID -eq "6005"){$event = "startup"
$user = $bootshutdown[$i].ReplacementStrings[1]
$userObject = New-Object System.Security.Principal.SecurityIdentifier($user)
$user = $userObject.Translate([System.Security.Principal.NTAccount])
}
if($bootshutdown[$i].EventID -eq "6006"){$event = "shutdown"
$user = "system"
}


$bootshutdownTable += [pscustomobject] @{"Time" = $bootshutdown[$i].TimeGenerated;
                                      "Id" = $bootshutdown[$i].EventID;
                                      "Event" = $event;
                                      "User" = $user;
                                      }
}
return $bootshutdownTable
}

