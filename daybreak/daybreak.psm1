Write-Host -ForegroundColor Yellow @"
 Welcome to Daybreak. A PowerShell Module adding Chinese language 'keywords', functions and CMDLETS to PowerShell.
 欢迎使用'破晓': 一个基于PowerShell的新编程语言.
"@

#region keywords, language structure alternatives
. $PSScriptRoot\langstructures\basicif.ps1
. $PSScriptRoot\langstructures\basicwhile.ps1
. $PSScriptRoot\langstructures\basicdo.ps1
#endregion

#region Cmdlets aliases
. $PSScriptRoot\aliases\corealiases.ps1
#endregion

#region verb and noun substitutions (with use proxy cmdlets for it) 
. $PSScriptRoot\proxyfuncs\measureobject.ps1
#endregion

#region number and other helpers , comparatives

#region comparatives
#this will have lots of comparisions build in eventually.
. $PSScriptRoot\operators\comparisons.ps1
#endregion

#region constants
. $PSScriptRoot\constants\numbers.ps1
. $PSScriptRoot\constants\misc.ps1
. $PSScriptRoot\constants\bool.ps1
#endregion

#region other helpers
. $PSScriptRoot\proxyfuncs\proxyhelpers.ps1
#endregion

#endregion

#region load custom format type data
Update-FormatData -PrependPath "$PSScriptRoot\zh-CN.daybreak.core.format.ps1xml"
#endregion
