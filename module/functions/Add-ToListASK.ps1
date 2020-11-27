function Add-ToListASK() {
    param (
       [parameter(Mandatory=$true)]
       $ASK,
       [parameter(Mandatory=$true)]
       $IsTest,
       [parameter(Mandatory=$true)]
       $listview,
       [parameter(Mandatory=$true)]
       $textboxRunLog,
       [parameter(Mandatory=$true)]
       $listviewArray
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
            if ($global:ASKChild.Host -ne $null) {
               $listv.SubItems.Add($global:ASKChild.Host.ToString());
            }

           
        }
        else {
            $listv = $listview.Items.Add($i);
            $listv.SubItems.Add($item.Name)
            $listv.SubItems.Add("parent")
            $listv.SubItems.Add("parent")
            $listv.SubItems.Add("parent")
            $listv.SubItems.Add("parent")
            $listv.SubItems.Add("parent");
      
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
                    if ($global:ASKChild.Host -ne $null) {
                       $listv.SubItems.Add($global:ASKChild.Host.ToString());
                    }
                    
      
                }
            }
        }
		$i++
	}
}

<#
$Global:listviewArray | Add-Member -MemberType NoteProperty -Name "ID" -Value $i
                    $Global:listviewArray | Add-Member -MemberType NoteProperty -Name "login" -Value $global:ASKChild.'Personal info'[0]
                    $Global:listviewArray | Add-Member -MemberType NoteProperty -Name "Other" -Value $global:ASKChild.ParentObject ,$global:ASKChild.'Personal info'[1],$global:ASKChild.'Date created'.ToString(),$global:ASKChild.Host
#>