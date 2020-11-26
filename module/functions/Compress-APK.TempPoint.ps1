function Compress-APK() {
    param (
       [parameter(Mandatory=$true)]
       $InputPath,
       [parameter(Mandatory=$true)]
       $RootFolder,
       [parameter(Mandatory=$true)]
       $IsTest,
       [parameter(Mandatory=$true)]
       $filename,
       [parameter(Mandatory=$true)]
       $textboxCreateLog

    )
    $textboxCreateLog.Text += "*LOG*---------Run compessAPK function" + $OFS
    if (!(Test-Path -Path "C:\NP\APS\files\$RootFolder\root")) {
        mkdir "C:\NP\APS\files\$RootFolder\root"
    }

    Compress-Archive -Path $InputPath -DestinationPath "C:\NP\APS\files\$filename.zip"
    if (Test-path "C:\NP\APS\files\$filename.zip" ) {
        $textboxCreateLog.Text += "*LOG*---------Archive OK" + $OFS
        Rename-Item -Path "C:\NP\APS\files\$filename.zip" -NewName "$filename.apk"
    } 
    else {
        $textboxCreateLog.Text += "*LOG*---------Archive does no exist" + $OFS
    }

    
    Remove-Item -Path "C:\NP\APS\files\$RootFolder" -Recurse -Confirm:$false
}