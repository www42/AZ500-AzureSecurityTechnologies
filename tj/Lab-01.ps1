# Exercise 1
# ----------
# Portal

# Exercise 2
# ----------
# Task 1
# 
$passwordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$passwordProfile.Password = 'Pa55w.rd1234'
Connect-AzureAD
$domainName = ((Get-AzureAdTenantDetail).VerifiedDomains)[0].Name
Get-AzureADUser

New-AzureADUser -DisplayName 'Isabel Garcia' `
-PasswordProfile $passwordProfile `
-UserPrincipalName "Isabel@$domainName" `
-AccountEnabled $true `
-MailNickName 'Isabel'

Get-AzureADUser

# Task 2
#
New-AzureADGroup -DisplayName 'Junior Admins' `
                 -MailEnabled $false `
                 -SecurityEnabled $true `
                 -MailNickName JuniorAdmins

Get-AzureADGroup

$user = Get-AzureADUser -Filter "MailNickName eq 'Isabel'"
Add-AzADGroupMember -MemberUserPrincipalName $user.userPrincipalName -TargetGroupDisplayName "Junior Admins" 
Get-AzADGroupMember -GroupDisplayName "Junior Admins"


# Exercise 3
#  --> Lab-01.azcli