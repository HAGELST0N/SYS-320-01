cd $PSScriptRoot

function SendAlertEmail($body){

$from = "patrick.hagelston@mymail.champlain.edu"
$to = "patrick.hagelston@mymail.champlain.edu"
$subject = "Suspicious Activity"

$password = "Not Real Password" | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $from, $password
Send-MailMessage -From $from -To $to -Subject $subject -body $body -SmtpServer "smtp.gmail.com"`
-Port 587 -UseSsl -Credential $credential
}

SendAlertEmail "Body of email"