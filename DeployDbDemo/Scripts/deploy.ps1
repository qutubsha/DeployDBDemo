﻿#--TeamCity checkout directory command line argument--
param([string]$tcDir = "")
        
#--Load the Dac.dll into the PowerShell session--
Add-Type -Path "C:\Program Files (x86)\Microsoft SQL Server\120\DAC\bin\Microsoft.SqlServer.Dac.dll"

#--Load the SQL Server instance--
$dacService = new-object Microsoft.SqlServer.Dac.DacServices "Server=SISAHDLPT067;User Id=sa;Password=sigma@123;"

#--Load the DACPAC--
$dacPac = [Microsoft.SqlServer.Dac.DacPackage]::Load("$tcDir\DeployDBDemo\bin\Release\DeployDBDemo.dacpac")
        
#--Deploy your database--
$dacService.deploy($dacPac, "QA", "True")