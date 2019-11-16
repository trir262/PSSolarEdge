# https://www.solaredge.com/sites/default/files/se_monitoring_api.pdf
# Only works for me since the .local_security folder is not send to github

$SolarEdgeConfig = (Get-Content "$($PSScriptRoot)\..\.local_security\SolarEdge.json") | ConvertFrom-Json
$SEURI = $SolarEdgeConfig.uri
$apikey="api_key=$($SolarEdgeConfig.api_key)"
$se = convertfrom-json (Invoke-WebRequest -Uri "$($SEURI)/sites/list?size=5&$($apikey)" -ContentType 'application/json; charset=utf-8').content
$mysite=($se.sites.site | Select-Object -First 1).id
$se.sites.site[0].uris


$Version = Invoke-WebRequest -Uri "$($SEURI)/version/current?$($apikey)" -ContentType 'application/json; charset=utf-8'
$sitedetail = Invoke-WebRequest -Uri "$($SEURI)/site/$($mysite)/details?$($apikey)" -ContentType 'application/json; charset=utf-8'
$siteDateperiod = Invoke-WebRequest -Uri "$($SEURI)/site/$($mysite)/dataPeriod?$($apikey)" -ContentType 'application/json; charset=utf-8'
$siteOverview = Invoke-WebRequest -Uri "$($SEURI)/site/$($mysite)/overview?$($apikey)" -ContentType 'application/json; charset=utf-8'
$siteEnergy = convertfrom-json (Invoke-WebRequest -Uri "$($SEURI)/site/$($mysite)/energy?$($apikey)&timeUnit=QUARTER_OF_AN_HOUR&startDate=2018-11-23&endDate=2018-12-08" -ContentType 'application/json; charset=utf-8').content
$powerDetails = convertfrom-json (Invoke-WebRequest -Uri "$($SEURI)/site/$($mysite)/powerDetails?$($apikey)&startTime=2019-01-20%2000:00:00&endTime=2019-01-16%2000:00:00" -ContentType 'application/json; charset=utf-8').content
$CurrentPowerFlow = convertfrom-json (Invoke-WebRequest -Uri "$($SEURI)/site/$($mysite)/currentPowerFlow?$($apikey)" -ContentType 'application/json; charset=utf-8').content
$equipment = convertfrom-json (Invoke-WebRequest -Uri "$($SEURI)/equipment/$($mysite)/list?$($apikey)" -ContentType 'application/json; charset=utf-8').content
$inventory = convertfrom-json (Invoke-WebRequest -Uri "$($SEURI)/site/$($mysite)/inventory?$($apikey)" -ContentType 'application/json; charset=utf-8').content
$Sensors = convertfrom-json (Invoke-WebRequest -Uri "$($SEURI)/equipment/$($mysite)/sensors?$($apikey)" -ContentType 'application/json; charset=utf-8').content
#$Meters = convertfrom-json (Invoke-WebRequest -Uri "$($SEURI)/equipment/$($mysite)/meters?$($apikey)&meters=" -ContentType 'application/json; charset=utf-8').content