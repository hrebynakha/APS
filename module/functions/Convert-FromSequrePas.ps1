function Convert-FromSequrePas() {
    param (
       [parameter(Mandatory=$true)]
       $InputPass,
       [parameter(Mandatory=$true)]
       $IsTest,
       [parameter(Mandatory=$true)]
       $AESKey
    )

    $OutPass = $null
    $unseq = $InputPass | ConvertTo-SecureString  -Key $AESKey
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($unseq)
    $OutPass=[System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
    return $OutPass

}
