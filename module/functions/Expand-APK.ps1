function Expand-APK() {
    param (
       [parameter(Mandatory=$true)]
       $RootFolder,
       [parameter(Mandatory=$true)]
       $IsTest,
       [parameter(Mandatory=$true)]
       $APSPass,
       [parameter(Mandatory=$true)]
       $OutPath
    )
    if (!(Test-Path "C:\Program Files\NP\APS\Temp\$RootFolder")) {
        [System.Windows.Forms.MessageBox]::Show('Archive not uncompressed or not exist', 'Information', 'OK', 'Error')
    }
    Expand-Archive -Path "C:\Program Files\NP\APS\Temp\$RootFolder" -DestinationPath $OutPath

}