Write-Host -ForegroundColor Yellow "Welcome to Daybreak. A PowerShell Module adding Chinese language 'keywords' `
, functions and CMDLETS to PowerShell。 \r \n `
欢迎，这是一个新程式语言叫破晓"

#region keywords, language structure alternatives

#if -non pipeline simple if
# 倘 tǎng 条件 tiáojiàn 就 jiù $否则 fǒuzé
function 倘 ($条件,$就,$否则) 
{
if (!($条件 -is [bool] -or $条件 -is [scriptblock] ))
 {
   throw "Only scriptblocks or booleans for the condition 条件"
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
if($条件) { 
    if ($就 -is [scriptblock]) {& $就} else {$就}   } 
    else { if($否则 -is [scriptblock]) {& $否则} else {$否则} } 
#TODO: make different parameter sets taking in bool and scriptblock
}

#endregion

#region Cmdlets aliases

#endregion

#region verb and noun substitutions (with use proxy cmdlets for it) 

#endregion

#region number and other helpers , comparatives

#endregion