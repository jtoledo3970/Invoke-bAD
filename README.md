# Invoke-bAD
A PowerShell script that will create an Active Directory environment with poor passwords, bad permissions practices, and random workstations.

# Disclaimer
This script will change your domain default password policy to remove complexity and set character requirement to 4, this is to allow for the creation of user accounts with poor passwords.

# How to use
On a domain controller run powershell ISE as an administrator and download this script.
```powershell
IEX((new-object net.webclient).downloadstring("https://raw.githubusercontent.com/jtoledo3970/Invoke-bAD/main/Invoke-bAD.ps1"));
```

You can then open this script in Powershell (or ISE) and run it AS ADMINISTRATOR.

It will ask you to specify the amount of OU's, users, and workstations you want to create and then place them in random locations and provide random attributes and permissions.
