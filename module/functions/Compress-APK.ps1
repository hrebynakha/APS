function Compress-APK() {
    param (
       [parameter(Mandatory=$true)]
       $InputPath,
       [parameter(Mandatory=$true)]
       $filename,
       [parameter(Mandatory=$true)]
       $textboxCreateLog,
       [parameter(Mandatory=$true)]
       $RootFolder,
	   [parameter(Mandatory = $true)]
	   $PathToArchive
    )
    #$textboxCreateLog.Text += "*LOG*---------Run compessAPK function" + $OFS
    if (!(Test-Path -Path $InputPath)) {
        Write-Host <#$textboxCreateLog.Text +=#> "*LOG*---------Path not found" #+ $OFS
        Wait-Event -Timeout 1
        return
    }
    else {
        Compress-Archive -Path $InputPath -DestinationPath "$PathToArchive\$filename.zip"
        if (Test-path "$PathToArchive\$filename.zip" ) {
            #$textboxCreateLog.Text += "*LOG*---------Archive OK" + $OFS
            Wait-Event -Timeout 1
            Rename-Item -Path "$PathToArchive\$filename.zip" -NewName "$filename.apk"
        } 
        else {
            #$textboxCreateLog.Text += "*LOG*---------Archive does no exist" + $OFS
        }
	
	    try
	    {
		    Remove-Item -Path "$InputPath" -Recurse -Confirm:$false
	    }
	    catch
	    {
		    #$textboxCreateLog.Text += "*LOG*---------Error $_ Folder $InputPath dont deleted" + $OFS
	    }
    }
    if (Test-path "$PathToArchive\TEMP-{$RootFolder}" ) {
        Remove-Item -Path "$PathToArchive\TEMP-{$RootFolder}" -Recurse -Force -Confirm:$false
    }
}