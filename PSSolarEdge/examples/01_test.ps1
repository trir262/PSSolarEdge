# https://www.solaredge.com/sites/default/files/se_monitoring_api.pdf
# Only works for me since the .local_security folder is not send to github

$SolarEdgeConfig = (Get-Content "$($PSScriptRoot)\..\.local_security\SolarEdge.json") | ConvertFrom-Json
$SEURI = $SolarEdgeConfig.uri
$apikey="api_key=$($SolarEdgeConfig.api_key)"
$se = Invoke-RestMethod -Uri "$($SEURI)/sites/list?size=5&$($apikey)" -ContentType 'application/json; charset=utf-8' # Get-SolarSite
$mysite=($se.sites.site | Select-Object -First 1).id
$se.sites.site[0].uris

$CT = 'application/json; charset=utf-8'

$TimeUnit = 'QUARTER_OF_AN_HOUR'
$StartDate = "$((([DateTime]::Now).AddDays(-6).Year))-$(([DateTime]::Now).Month)-01"
$EndDate = "$((([DateTime]::Now)).Year)-$(([DateTime]::Now).Month)-01"

$Time = "$(([DateTime]::Now).tostring('HH:mm:ss'))"
$StartDateTime = "$($StartDate)%20$($Time)"
$EndDatetime="$($EndDate)%20$($Time)"

$Version = Invoke-RestMethod -Uri "$($SEURI)/version/current?$($apikey)" -ContentType $CT # Get-SolarAPIVersion
$SupportedVersion = Invoke-RestMethod -Uri "$($SEURI)/version/supported?$($apikey)" -ContentType $CT # Get-SolarAPISupportedVersion

$sitedetail = Invoke-RestMethod -Uri "$($SEURI)/site/$($mysite)/details?$($apikey)" -ContentType $CT # Get-SolarSiteDetail
$siteDateperiod = Invoke-RestMethod -Uri "$($SEURI)/site/$($mysite)/dataPeriod?$($apikey)" -ContentType $CT # Get-SolarSiteData
$siteOverview = Invoke-RestMethod -Uri "$($SEURI)/site/$($mysite)/overview?$($apikey)" -ContentType $CT # Get-SolarSiteOverview
$siteEnergy = Invoke-RestMethod -Uri "$($SEURI)/site/$($mysite)/energy?$($apikey)&timeUnit=$($TimeUnit)&startDate=$($StartDate)&endDate=$($EndDate)" -ContentType $CT # Get-SolarSiteEnergy
$powerDetails = Invoke-RestMethod -Uri "$($SEURI)/site/$($mysite)/powerDetails?$($apikey)&startTime=$($StartDateTime)&endTime=$($EndDateTime)" -ContentType $CT # Get-SolarSitePowerDetails
$CurrentPowerFlow = Invoke-RestMethod -Uri "$($SEURI)/site/$($mysite)/currentPowerFlow?$($apikey)" -ContentType $CT # Get-SolarSitePowerFlow
$EquipmentList = Invoke-RestMethod -Uri "$($SEURI)/equipment/$($mysite)/list?$($apikey)" -ContentType $CT # Get-SolarEquipmentList
$Inventory = Invoke-RestMethod -Uri "$($SEURI)/site/$($mysite)/inventory?$($apikey)" -ContentType $CT # Get-SolarSiteInventory
$InventoryDetail = Invoke-RestMethod -Uri "$($SEURI)/equipment/$($mysite)/$($inventory.Inventory.inverters.sn)/data?$($apikey)&startTime=$($StartDateTime)&endTime=$($EndDatetime)" -ContentType $CT # Get-SolarEquipmentData
#$InventoryChangeLog = Invoke-RestMethod -Uri "$($SEURI)/equipment/$($mysite)/$($inventory.Inventory.inverters.sn)/changeLog?$($apikey)" -ContentType $CT # Access denied

$Sensors = Invoke-RestMethod -Uri "$($SEURI)/equipment/$($mysite)/sensors?$($apikey)" -ContentType $CT # Get-SolarEquipmentSensor
$Meters = Invoke-RestMethod -Uri "$($SEURI)/site/$($mysite)/meters?$($apikey)&startTime=$($StartDateTime)&endTime=$($EndDatetime)&timeUnit=QUARTER_OF_AN_HOUR" -ContentType $CT # Get-SolarSiteMeter
$Power=Invoke-RestMethod -Uri "$($SEURI)/site/$($mysite)/power?$($apikey)&startTime=$($StartDateTime)&endTime=$($EndDatetime)" -ContentType $CT # Get-SolarSitePower
$EnvBenefits = Invoke-RestMethod -Uri "$($SEURI)/site/$($mysite)/envBenefits?$($apikey)&systemUnits=Metrics" -ContentType $CT # Get-SolarSiteBenefit
