# Exercise 1
# ------------
# Task 1  --> Portal

# Task 2
$rgName = 'AZ500LAB10'
$location = 'westeurope'
Get-AzResourceGroup -Name $rgName

$kvName = 'az500kv' + $(Get-Random)
New-AzKeyVault -VaultName $kvName -ResourceGroupName $rgName -Location $location

# Weiter im Portal. (Punkt 8.)

# Task 3
$kv = Get-AzKeyVault -ResourceGroupName $rgName
$key = Add-AZKeyVaultKey -VaultName $kv.VaultName -Name 'MyLabKey' -Destination 'Software'
Get-AZKeyVaultKey -VaultName $kv.VaultName
$key.key.kid

# Task 4
$secretvalue = ConvertTo-SecureString 'Pa55w.rd1234' -AsPlainText -Force
$secret = Set-AZKeyVaultSecret -VaultName $kv.VaultName -Name 'SQLPassword' -SecretValue $secretvalue
Get-AZKeyVaultSecret -VaultName $kv.VaultName

# Weiter im Portal (Punkt 6.)


# Exercise 2
# ----------

# Task 1 --> Portal: App Registration
#
#   appId:         a27bef3d-48e3-4938-a855-396e0c5ccfc5
#   clientSecret:  PEW8xV-2N61dKOQxWVxf_~q2URlv_QAiCm

# Task 2
$applicationId = 'a27bef3d-48e3-4938-a855-396e0c5ccfc5'
$kvName = (Get-AzKeyVault -ResourceGroupName 'AZ500LAB10').VaultName
Set-AZKeyVaultAccessPolicy -VaultName $kvName `
                           -ResourceGroupName AZ500LAB10 `
                           -ServicePrincipalName $applicationId `
                           -PermissionsToKeys get,wrapKey,unwrapKey,sign,verify,list

# Task 3 --> Portal

# ADO.NET Connection String
Server=tcp:medical69124.database.windows.net,1433;Initial Catalog=medical;Persist Security Info=False;User ID=Student;Password=Pa55w.rd1234;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;


# Der Rest im Portal
