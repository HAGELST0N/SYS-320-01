. "C:\Users\champuser\SYS-320-01\week6\main\Event-Logs.ps1"
. "C:\Users\champuser\SYS-320-01\week7\Email.ps1"
. "C:\Users\champuser\SYS-320-01\week7\Scheduler.ps1"
. "C:\Users\champuser\SYS-320-01\week7\Configuration.ps1"

# Obtaining configuration
$configuration = readConfiguration

# Obtaining at risk users
$failed = atRiskUsers $configuration.days

# Sending at risk users as email
sendAlertEmail($Failed | Format-Table | Out-String)

# Setting the script to be run daily
ChooseTimeToRun($configuration.