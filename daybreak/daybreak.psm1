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
set-alias 言 write-host  
#endregion

#region verb and noun substitutions (with use proxy cmdlets for it) 

#endregion

#region number and other helpers , comparatives
#this will have lots of comparisions build in eventually.

function 比较 ($第一件事,$比,[switch]$大)
{
 if ($大)
 {
   return ($第一件事 -gt $比)
 }
 else { throw "other comparisions not yet supported" }
}
#endregion

#region numbers
Set-Variable -Name 零 -Value 0 -Scope global -Option ReadOnly
Set-Variable -Name 一 -Value 1 -Scope global -Option ReadOnly
Set-Variable -Name 二 -Value 2 -Scope global -Option ReadOnly
Set-Variable -Name 三 -Value 3 -Scope global -Option ReadOnly
Set-Variable -Name 四 -Value 4 -Scope global -Option ReadOnly
Set-Variable -Name 五 -Value 5 -Scope global -Option ReadOnly
Set-Variable -Name 六 -Value 6 -Scope global -Option ReadOnly
Set-Variable -Name 七 -Value 7 -Scope global -Option ReadOnly
Set-Variable -Name 八 -Value 8 -Scope global -Option ReadOnly
Set-Variable -Name 九 -Value 9 -Scope global -Option ReadOnly
Set-Variable -Name 十 -Value 10 -Scope global -Option ReadOnly

#end