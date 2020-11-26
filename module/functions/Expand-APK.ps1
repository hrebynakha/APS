function Expand-APK() {
    param (
       [parameter(Mandatory=$true)]
       $filename,
       [parameter(Mandatory=$false)]
       $IsTest,
       [parameter(Mandatory=$false)]
       $APSPass,
       [parameter(Mandatory=$true)]
       $RootFolder
    )
    if (!(Test-Path "C:\NP\APS\files\$filename.apk")) {
        [System.Windows.Forms.MessageBox]::Show('Archive not uncompressed or not exist', 'Information', 'OK', 'Error')
    }
    if (!(Test-Path "C:\NP\APS\files\TEMP-{$RootFolder}")) {
        mkdir "C:\NP\APS\files\TEMP-{$RootFolder}"
    }
    Rename-Item "C:\NP\APS\files\$filename.apk" -NewName "C:\NP\APS\files\$filename.zip"
    Expand-Archive -Path "C:\NP\APS\files\$filename.zip" -DestinationPath "C:\NP\APS\files\TEMP-{$RootFolder}"
    Remove-Item -Path  "C:\NP\APS\files\$filename.zip"

}