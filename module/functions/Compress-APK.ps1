function Compress-APK() {
    param (
       [parameter(Mandatory=$true)]
       $InputPath,
       [parameter(Mandatory=$true)]
       $filename,
       [parameter(Mandatory=$true)]
       $textboxCreateLog

    )
    $textboxCreateLog.Text += "*LOG*---------Run compessAPK function" + $OFS
    if (!(Test-Path -Path $InputPath)) {
        $textboxCreateLog.Text += "*LOG*---------Path not found" + $OFS
        Wait-Event -Timeout 1
        return
    }
    else {
        Compress-Archive -Path $InputPath -DestinationPath "C:\NP\APS\files\$filename.zip"
        if (Test-path "C:\NP\APS\files\$filename.zip" ) {
            $textboxCreateLog.Text += "*LOG*---------Archive OK" + $OFS
            Wait-Event -Timeout 1
            Rename-Item -Path "C:\NP\APS\files\$filename.zip" -NewName "$filename.apk"
        } 
        else {
            $textboxCreateLog.Text += "*LOG*---------Archive does no exist" + $OFS
        }
	
	    try
	    {
		    Remove-Item -Path "$InputPath" -Recurse -Confirm:$false
	    }
	    catch
	    {
		    $textboxCreateLog.Text += "*LOG*---------Error $_ Folder $InputPath dont deleted" + $OFS
	    }
    }

    
}