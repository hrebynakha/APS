#initialize global Parameters
$global:GLModuleBasePath = $PSScriptRoot
#Get public and private function definition files.
$Functions  = @( Get-ChildItem -Path $PSScriptRoot\functions\*.ps1 -ErrorAction SilentlyContinue )
$Employee = @( Get-ChildItem -Path $PSScriptRoot\Employee\*.ps1 -ErrorAction SilentlyContinue )
#Dot source the files
Foreach($import in @($Functions  + $Employee))
{
  
    Try
    {
        . $import.fullname
    }
    Catch
    {
        Microsoft.PowerShell.Utility\Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

Export-ModuleMember -Function $Functions.Basename
Export-ModuleMember -Function $Employee.Basename