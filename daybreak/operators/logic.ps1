<#
.Synopsis
   逻辑与运算
.DESCRIPTION
   逻辑与运算
.EXAMPLE
   且 $真 $假
   且 $真 $真 $假
.EXAMPLE
   且 (比较 10 大于 3)
   且 {比较 3 小于 10}
   且 (比较 10 大于 3) {比较 3 小于 10} $真
#>
function 且 # operator -and 'Qiě'
{
 foreach ($expr in $args)
 {
  if($expr -is [scriptblock]) { $expr= & $expr  }
  if( ($expr -eq $false -or $_ -eq $expr)) {return $false }
 }
 return $true
}

<#
.Synopsis
   逻辑或运算
.DESCRIPTION
   逻辑或运算
.EXAMPLE
   或 $真 $假
   或 $真 $真 $假
.EXAMPLE
   或 (比较 10 大于 3)
   或 {比较 3 小于 10}
   或 (比较 10 大于 3) {比较 3 小于 10} $真
#>
function 或 # operator -or 'Huò'
{
 foreach ($expr in $args)
 {
  if($expr -is [scriptblock]) { $expr= & $expr  }
  if( ($expr -eq $true)) {return $true }
 }
 return $false
}

<#
.Synopsis
   逻辑非运算
.DESCRIPTION
   逻辑非运算
.EXAMPLE
   非 $真
   非 (比较 10 大于 3)
   非 {比较 3 小于 10}
#>
function 非 # operator -not 'Fēi'
{
 if($args.Length -eq 0)
 {
  # Expression,boolean,or scriptblock required for arguments. 
  Write-Error '参数需要指定表达式，布尔类型或者脚本块。' 
 }
 elseif($args.Length -eq 1)
 {
   if($args[0] -is [scriptblock]) { return -not (& $args[0])}
   return -not $args[0]
 }
 else{
   return $false
 }
}
