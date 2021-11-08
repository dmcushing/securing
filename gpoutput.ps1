$gponame=$args[0]
# Get the GPO Guid
$Id = (Get-GPO -DisplayName $gponame).Id
# Store the output in a (XML) variable
[xml]$GpoXml = Get-GPOReport -Guid $Id -ReportType Xml

#Create a custom object containing only the policy "fields" we're interested in
$PolicyDetails = foreach ($p in $GpoXml.GPO.Computer.ExtensionData.Extension.Policy) {
    [PSCustomObject]@{
        "Name" = $p.Name
        "State" = $p.State
    }
}

#Let's see the results
$PolicyDetails