Add-PSSnapin *sharepoint*
$rows = Import-CSV -path "C:\_Source\run.csv"
$web = Get-SPWeb "*************************"

foreach ($row in $rows) {
    <# $row is the current item #>
    $row.ItemID
    $row.tp_Title
    $row.WorkflowName
    $ListName = $row.tp_Title
    $ItemID = $row.ItemID
    $WorkflowName = $row.WorkflowName
    $List = $web.Lists[$ListName]
    $ListItem = $List.GetItembyID($ItemID)
    $wfrunoption = [microsoft.sharepoint.workflow.spworkflowrunoptions]::synchronous
    $assoc = $list.WorkflowAssociations.GetAssociationByName($WorkflowName , "en-US")
    $data = $assoc.AssociationData
    $manager=$Web.site.WorkFlowManager
    $wf = $manager.StopWorkFlow($list.GetItemById($ListItem.ID), $assoc, $data, $true)
}
