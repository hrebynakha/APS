function Convert-ToSequrePas() {
    param (
       [parameter(Mandatory=$true)]
       $InputPass,
       [parameter(Mandatory=$true)]
       $IsTest,
       [parameter(Mandatory=$true)]
       $AESKey
    )
    $OutPass = $null
    $OutPass = $InputPass | ConvertTo-SecureString  -AsPlainText -Force | ConvertFrom-SecureString -Key $AESKey
    return $OutPass

}
