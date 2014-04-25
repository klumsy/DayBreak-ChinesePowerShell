Write-Host -ForegroundColor Yellow @"
 Welcome to Daybreak. A PowerShell Module adding Chinese language 'keywords', functions and CMDLETS to PowerShell.
 欢迎使用'破晓': 一个基于PowerShell的新编程语言.
"@

#region keywords, language structure alternatives

#if -non pipeline simple if
# 如果 Rúguǒ 条件 tiáojiàn 满足 tiáojiàn 就 jiù $否则 fǒuzé
function 如果 ($条件,$就,$否则) 
{
if (!($条件 -is [bool] -or $条件 -is [scriptblock] ))
 {
   #"Only scriptblocks or booleans for the condition 条件"
   throw "条件只接受布尔类型和脚本块."
 }
 #if (!($就 -is [Scriptblock]))
 #{
 #  throw "Only scriptblocks for the then 就"
 #}
 #if (!($否则 -is [Scriptblock] -or $否则 -eq $Null))
 #{
 #  throw "Only scriptblocks(or null) for the else 否则"
 #}

if ($条件 -is [scriptblock]) {$条件 = & $条件 } 
if($条件) 
{ 
 if ($就 -is [scriptblock]) 
 {& $就} 
 else {$就}   
} 
else 
{ 
 if($否则 -is [scriptblock]) 
 {& $否则} 
 else {$否则} } 
 #TODO: make different parameter sets taking in bool and scriptblock
}

#simple while loop
function 重复 ($做,$当)
{
 if (!($当 -is [scriptblock] ))
 {
   #"Only scriptblocks for the condition 当"
   throw "条件'当'只接受脚本块."
 }
 Invoke-Expression ( "while($当)
 {
  $做
 }")
}

#simple do-while loop
function 先重复 ($做,$当=$false)
{
 if (!($当 -is [scriptblock] ))
 {
   #"Only scriptblocks for the condition 当"
   throw "条件'当'只接受脚本块."
 }
 Invoke-Expression ( "do{
  $做
 }while($当)")
}
#endregion

#region Cmdlets aliases
set-alias 说 write-host  -Scope 'global'
#endregion

#region verb and noun substitutions (with use proxy cmdlets for it) 

#region Measure-Object
function 度量对象
{
[CmdletBinding(DefaultParameterSetName='GenericMeasure', HelpUri='http://go.microsoft.com/fwlink/?LinkID=113349', RemotingCapability='None')]
param(
    [Parameter(ValueFromPipeline=$true)]
    [psobject]
    ${输入对象},

    [Parameter(Position=0)]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${属性},

    [Parameter(ParameterSetName='GenericMeasure')]
    [switch]
    ${总计},

    [Parameter(ParameterSetName='GenericMeasure')]
    [switch]
    ${平均值},

    [Parameter(ParameterSetName='GenericMeasure')]
    [switch]
    ${最大值},

    [Parameter(ParameterSetName='GenericMeasure')]
    [switch]
    ${最小值},

    [Parameter(ParameterSetName='TextMeasure')]
    [switch]
    ${行},

    [Parameter(ParameterSetName='TextMeasure')]
    [switch]
    ${单词},

    [Parameter(ParameterSetName='TextMeasure')]
    [switch]
    ${字符},

    [Parameter(ParameterSetName='TextMeasure')]
    [switch]
    ${忽略白空格})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        
        # Resove PSBoundParameters
        $PSBoundParameters = Resolve-PSBoundParameters -BoundParameters $PSBoundParameters -Cmdlet 'Measure-Object'

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Measure-Object', [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters }
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process
{
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end
{
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
<#

.ForwardHelpTargetName Measure-Object
.ForwardHelpCategory Cmdlet

#>
}
#endregion

#endregion

#region number and other helpers , comparatives

#region comparatives
#this will have lots of comparisions build in eventually.

function 比较
{
 param(
 $前者,
 [ValidateSet('等于','不等于','大于', '大于等于','小于', '小于等于')]
 $条件,
 $后者
 )
 switch($条件)
 {
   '等于'{ return $前者 -eq $后者 }     # equal
   '不等于'{ return $前者 -ne $后者 }   # not equle
   '大于'{ return $前者 -gt $后者 }     # large than
   '大于等于'{ return $前者 -ge $后者}  # large than or equal
   '小于'{ return $前者 -lt $后者 }     # less than
   '小于等于'{ return $前者 -le $后者 } # less than ro equal
   default { return '其它的条件运算暂不支持.'} # other comparisions not yet supported
 }
}
#endregion

#region numbers
Set-Variable -Name 零 -Value 0 -Scope global -Option ReadOnly -Force
Set-Variable -Name 一 -Value 1 -Scope global -Option ReadOnly -Force
Set-Variable -Name 二 -Value 2 -Scope global -Option ReadOnly -Force
Set-Variable -Name 三 -Value 3 -Scope global -Option ReadOnly -Force
Set-Variable -Name 四 -Value 4 -Scope global -Option ReadOnly -Force
Set-Variable -Name 五 -Value 5 -Scope global -Option ReadOnly -Force
Set-Variable -Name 六 -Value 6 -Scope global -Option ReadOnly -Force
Set-Variable -Name 七 -Value 7 -Scope global -Option ReadOnly -Force
Set-Variable -Name 八 -Value 8 -Scope global -Option ReadOnly -Force
Set-Variable -Name 九 -Value 9 -Scope global -Option ReadOnly -Force
Set-Variable -Name 十 -Value 10 -Scope global -Option ReadOnly -Force
#endregion

#region booleans
Set-Variable -Name 真 -Value $true -Scope global -Option ReadOnly -Force
Set-Variable -Name 假 -Value $true -Scope global -Option ReadOnly -Force
#endregion

#region other helpers

#Convert hashtable to readonly dictionary
function ConvertTo-ReadOnlyDictionary([System.Collections.Hashtable]$Hashtable=@{})
{
    $dict=New-Object 'System.Collections.Generic.Dictionary[[string],[object]]'
    $Hashtable.Keys.ForEach({$dict.Add($_,$Hashtable[$_])})
    return [System.Collections.ObjectModel.ReadOnlyDictionary[[string],[object]]]$dict
}

#Replace the localized parameter name with original engligsh name
function Resolve-PSBoundParameters($BoundParameters,$Cmdlet)
{
    $tempKeys = $BoundParameters.Keys.Where({$_ -in $LocalizedCmdletParameters.$Cmdlet.Keys})
    #Write-Verbose ($BoundParameters | Out-String)
    foreach($key in $tempKeys)
    {
          #add new key using english parameter name
          $BoundParameters.Add($LocalizedCmdletParameters.$Cmdlet.$key,$BoundParameters.$key) | Out-Null
          #remove old localized parameter name
          $BoundParameters.Remove($key) | Out-Null
    }
    #Write-Verbose ($BoundParameters | Out-String)
    return $BoundParameters
}

#Localized parameters for proxy Cmdlets
Get-Variable -Name LocalizedCmdletParameters -ea SilentlyContinue | Remove-Variable
New-Variable -Option Constant  -Name LocalizedCmdletParameters -Value (
    ConvertTo-ReadOnlyDictionary -Hashtable @{
     #Measure-Object
        'Measure-Object' = ConvertTo-ReadOnlyDictionary -Hashtable @{
            输入对象 = 'InputObject';
            属性 = 'Property';
            总计 = 'Sum';
            平均值 = 'Average';
            最大值 ='Maximum';
            最小值 = 'Minimum';
            行 = 'Line';
            单词 = 'Word';
            字符 ='Character';
            忽略白空格 = 'IgnoreWhiteSpace'}
    }
)

#endregion

#endregion

#region load custom format type data
Update-FormatData -PrependPath "$PSScriptRoot\zh-CN.daybreak.core.format.ps1xml"
#endregion
