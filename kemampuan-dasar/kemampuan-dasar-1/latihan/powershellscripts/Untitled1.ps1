<#
.SYNOPSIS
Shows when last your PC started up.
.DESCRIPTION
This is a WMI wrapper function to get the time that your PC last started up.
.PARAMETER ComputerName
The name of the Computer you want to run the command against.
.EXAMPLE
Get-LastBootTime -ComputerName localhost
.LINK
www.howtogeek.com
#>
param(
    [string]$ComputerName
)

Get-WmiObject -Class win32_OperatingSystem -ComputerName localhost |
Select-Object -Property CSname,@{n="Last Booted";
e={[Management.ManagementDateTimeConverter]::ToDateTime($_.LastBootUpTime)}}
© 2019 GitHub, Inc.