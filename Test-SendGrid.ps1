# Test-SendGrid.ps1 - script to test SendGrid

# Setup key variables
$To         = “you@youremail.com”
# The FROM: email address is always dave@davecushing.ca 
$Fr         = “dave@davecushing.ca”
$Subj       = “Test Email via SendGrid”
$body       = "testing - testing"
$SmtpSrv    = “localhost”

# And send the email
Send-Mailmessage -To $To -From $Fr -Subj $Subj -Body $body -SmtpServer $SmtpSrv
