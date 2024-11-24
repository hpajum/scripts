Add-PSSnapin Microsoft.SharePoint.Powershell -ErrorAction SilentlyContinue


 $outfile = "C:\_Source\csv\feature.csv"
 $newcsv = {} | Select "FeatureName","CLevel","Scope","Site" | Export-Csv $outfile
 $csvfile = Import-Csv $outfile


 ForEach ($WebApp in Get-SPWebApplication) {
    $wfs = Get-SPFeature -WebApplication $WebApp.url 
    foreach ($wf in $wfs) {
        $csvfile.FeatureName=$wf.DisplayName
        $csvfile.CLevel=$wf.CompatibilityLevel
        $csvfile.Scope=$wf.Scope
        $csvfile.Site=$WebApp.url 
        $csvfile | Export-CSV $outfile -Append
    }
    foreach ($site in $WebApp.sites){
        $scfs = Get-SPFeature -Site $site.url
        foreach ($scf in $scfs){
        $csvfile.FeatureName=$scf.DisplayName
        $csvfile.CLevel=$scf.CompatibilityLevel
        $csvfile.Scope=$scf.Scope
        $csvfile.Site=$site.url 
        $csvfile | Export-CSV $outfile -Append
        }
        foreach ($web in $site.AllWebs) {
             $sfs = Get-SPFeature -Web $web 
             foreach ($sf in $sfs) {
                $csvfile.FeatureName=$sf.DisplayName
                $csvfile.CLevel=$sf.CompatibilityLevel
                $csvfile.Scope=$sf.Scope
                $csvfile.Site=$web.Url 
                $csvfile | Export-CSV $outfile -Append

             }

        }
        
    }
 
 }
