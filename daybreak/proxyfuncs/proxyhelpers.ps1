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
#TODO: make something that can scale easily for multiple cmdlets.
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
