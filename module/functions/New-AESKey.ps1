function New-AESKey() {
    param (
       [parameter(Mandatory=$true)]
       $IsTest
    )
    $AESKey = New-Object Byte[] 32
    [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($AESKey)
    return $AESKey

}