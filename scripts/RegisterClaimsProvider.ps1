Add-PSSnapin Microsoft.SharePoint.PowerShell

$providerName = "Your trusted login provider name"
$userSorceUrl = "Uri of your user source"

$sts = Get-SPSecurityTokenServiceConfig
$trustedLoginProvider = $sts.TrustedLoginProviders[$providerName]
if ($trustedLoginProvider)
{
    $trustedLoginProvider.ClaimProviderName = "SAMLClaimsProvider"
    $trustedLoginProvider.Update()
}

$farm = Get-SPFarm
$farm.Properties["SAMLUserSource"] = $userSorceUrl
$farm.Update()