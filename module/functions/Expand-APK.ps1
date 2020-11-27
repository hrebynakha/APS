function Expand-APK() {
    param (
       [parameter(Mandatory=$true)]
       $filename,
       [parameter(Mandatory=$false)]
       $IsTest,
       [parameter(Mandatory=$false)]
       $APSPass,
       [parameter(Mandatory=$true)]
       $RootFolder,
       [parameter(Mandatory=$true)]
       $PathToArchive

    )
    if (!(Test-Path "$PathToArchive\$filename.apk")) {
        [System.Windows.Forms.MessageBox]::Show('Archive not uncompressed or not exist', 'Information', 'OK', 'Error')
    }
    if (!(Test-Path "$PathToArchive\TEMP-{$RootFolder}")) {
        mkdir "$PathToArchive\TEMP-{$RootFolder}"
    }
    Rename-Item "$PathToArchive\$filename.apk" -NewName "$PathToArchive\$filename.zip"
    Expand-Archive -Path "$PathToArchive\$filename.zip" -DestinationPath "$PathToArchive\TEMP-{$RootFolder}"
    Remove-Item -Path  "$PathToArchive\$filename.zip"

}