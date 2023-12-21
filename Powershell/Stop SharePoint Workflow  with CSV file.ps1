Add-PSSnapin *sharepoint*
$rows = Import-CSV -path "C:\_Source\run.csv"
$web = Get-SPWeb "********************************"


foreach ($row in $rows) {
    $ListName = $row.tp_Title
    $wfName= $row.WorkflowName
    $ItemID = $row.ItemID
    $list = $web.Lists[$ListName]
    $TargetIT=$list.Items | where{$_.ID -eq $ItemID}
    $item=$list.Items | where{$_.ID -eq $ItemID}
    $assoc = $list.WorkflowAssociations  | where {$_.Name -like $wfName}
    $wf=$item.Workflows
    $wfIntState = $wf.InternalState
    Write-Host "- Canceling workflow on item $($wf) of $($wfIntState) (ID: $($TargetIT.ID)) ... " 
    foreach ($wfname in $wf) {
    $assoc = $list.WorkflowAssociations  | where {$_.Name -like $wfName}
    [Microsoft.SharePoint.Workflow.SPWorkflowManager]::CancelWorkflow($wfname);}
    Write-Host $wfname "/" $ListName "Done!"
    
}

