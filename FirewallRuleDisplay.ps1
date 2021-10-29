$rulename=$args[0]
Get-NetFirewallRule -DisplayName $rulename |
Format-Table DisplayName,
@{Name='Protocol';Expression={($PSItem | Get-NetFirewallPortFilter).Protocol}},
@{Name='Program';Expression={($PSItem | Get-NetFirewallApplicationFilter).Program}},
@{Name='LocalPort';Expression={($PSItem | Get-NetFirewallPortFilter).LocalPort}},
@{Name='RemotePort';Expression={($PSItem | Get-NetFirewallPortFilter).RemotePort}},
@{Name='RemoteAddress';Expression={($PSItem | Get-NetFirewallAddressFilter).RemoteAddress}},
Enabled,
Direction,
Action
