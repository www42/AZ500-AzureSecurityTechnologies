# Task 1
# ------
$Location = 'EastUS2'
New-AzResourceGroup -Name AZ500LAB131415 -Location $Location
New-AzVm -ResourceGroupName "AZ500LAB131415" `
         -Name "myVM" `
         -Location $Location `
         -VirtualNetworkName "myVnet" `
         -SubnetName "mySubnet" `
         -SecurityGroupName   "myNetworkSecurityGroup" `
         -PublicIpAddressName "myPublicIpAddress" `
         -OpenPorts 80,3389
# user: localadmin
# password: Pa55w.rd1234

Get-AzVM -Name 'myVM' -ResourceGroupName 'AZ500LAB131415' | Format-Table

# Tasks 2 - 5  --> Portal
# ------------------------
