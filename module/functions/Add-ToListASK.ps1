function Add-ToListASK() {
    param (
       [parameter(Mandatory=$true)]
       $ASK,
       [parameter(Mandatory=$true)]
       $IsTest,
       [parameter(Mandatory=$true)]
       $listview,
       [parameter(Mandatory=$true)]
       $textboxRunLog
    )
    $i=0
    foreach ($item in $global:ASK) {
        $textboxRunLog.Text += "*LOG*---------File $($item.FullName) OK" + $OFS
        if ($item.Attributes -eq "Archive") {
            $global:ASKChild = Import-Clixml -Path $item.FullName | select *
            $listv = $listview.Items.Add($i);
            $listv.SubItems.Add($global:ASKChild.ParentObject);
		    $listv.SubItems.Add($global:ASKChild.'Personal info'[0]);
		    $listv.SubItems.Add($global:ASKChild.PWD);
		    $listv.SubItems.Add($global:ASKChild.'Personal info'[1]);
		    $listv.SubItems.Add($global:ASKChild.'Date created'.ToString());
        }
        else {
            $listv = $listview.Items.Add($i);
            $listv.SubItems.Add($item.Name)
            $listv.SubItems.Add("-")
            $listv.SubItems.Add("-")
            $listv.SubItems.Add("-")
            $listv.SubItems.Add("-")
            foreach ($child in Get-ChildItem -Path $item.FullName) {
                $global:ASKParentChild = Import-Clixml -Path "$($item.FullName)\$($child.Name)" 
                $textboxRunLog.Text += "*LOG*---------File $child OK" + $OFS
                if ($child.Attributes -eq "Archive") {
                    $i++
                    $textboxRunLog.Text += "*LOG*---------File $child OK" + $OFS
                    $listv = $listview.Items.Add($i);
                    $listv.SubItems.Add($global:ASKParentChild.ParentObject);
		            $listv.SubItems.Add($global:ASKParentChild.'Personal info'[0]);
		            $listv.SubItems.Add($global:ASKParentChild.PWD);
		            $listv.SubItems.Add($global:ASKParentChild.'Personal info'[1]);
		            $listv.SubItems.Add($global:ASKParentChild.'Date created'.ToString());  
                }
            }
        }
		$i++
	}
}