
# Example env variables for powershell scripts inside terraform for azure devops

$subscriptionId = $env:ARM_SUBSCRIPTION_ID
$tenantId = $env:ARM_TENANT_ID
$clientId = $env:ARM_CLIENT_ID
$secret = $env:ARM_CLIENT_SECRET

az login --service-principal --username $clientId --password $secret --tenant $tenantId
az account set -s $subscriptionId