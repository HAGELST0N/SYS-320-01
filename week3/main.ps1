.(join-path $PSScriptRoot Function_Event_Logs.ps1)

$loginOutsTable = getLoginOuts 14
$loginOutsTable

$shutdownsTable = getBootShutdown 14
$shutdownsTable