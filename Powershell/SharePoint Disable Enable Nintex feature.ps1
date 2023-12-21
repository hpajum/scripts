Get-SPFeature -Limit ALL | Where-Object {$_.DisplayName -like "*nintex*"}

$NWSiteFeature = '0561d315-d5db-4736-929e-26da142812c5'
$NWWebFeature = '9bf7bf98-5660-498a-9399-bc656a61ed5d'
 
foreach($feature in $(Get-SPWebApplication -Identity https://cometportal.com).QueryFeatures([Guid]$NWSiteFeature)){
 
Write-Host "Processing $($feature.Parent.Url)"
 
Disable-SPFeature -Url $feature.Parent.Url -Identity $NWSiteFeature -Confirm:$false
 
Enable-SPFeature -Url $feature.Parent.Url -Identity $NWSiteFeature
 
foreach ($webFeature in $feature.Parent.QueryFeatures([Guid]$NWWebFeature)){
 
Write-Host "Processing $($WebFeature.Parent.Url)"
 
Disable-SPFeature -Url $webFeature.Parent.Url -Identity $NWWebFeature -Confirm:$false
 
Enable-SPFeature -Url $webFeature.Parent.Url -Identity $NWWebFeature
 
Write-Host "Completed $($WebFeature.Parent.Url)"
 
}
 
Write-Host "Completed $($feature.Parent.Url)"
 
}
