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
