$TestOU=$args[0]
Clear-Host
$PCs = Get-ADComputer -Filter * -SearchBase $TestOU
$Results = ForEach ($Computer in $PCs)
{
New-Object PSObject -Property @{
ComputerName = $Computer.Name
RecoveryPassword = Get-ADObject -Filter 'objectclass -eq "msFVE-RecoveryInformation"' -SearchBase $computer.DistinguishedName -Properties msFVE-RecoveryPassword,whencreated | sort whencreated -Descending | select -ExpandProperty msfve-recoverypassword
}
}
$Results