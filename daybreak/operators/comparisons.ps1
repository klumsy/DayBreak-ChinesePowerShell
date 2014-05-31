function 比较
{
 param(
 $前者,
 [ValidateSet('等于','不等于','大于', '大于等于','小于', '小于等于','相似','不相似','匹配','不匹配','包含','不包含','在','不在')]
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
   '相似'{ return $前者 -like $后者 }   # like
   '不相似'{ return $前者 -notlike $后者 }   # not like
   '匹配'{ return $前者 -match $后者 }       # match
   '不匹配'{ return $前者 -notmatch $后者 }  # not match
   '包含'{ return $前者 -contains $后者 }    # contains
   '不包含'{ return $前者 -notcontains $后者 } # not contains
   '在'{ return $前者 -in $后者 }            # in
   '不在'{ return $前者 -notin $后者 }       # not in
   default { return '其它的条件运算暂不支持.'} # other comparisions not yet supported
 }
}

<#
.Synopsis
   替换指定元素的值
.DESCRIPTION
   替换指定元素的值
.EXAMPLE
   替换 -源 $三,$四,$五 -中的 $四 -为 $六
   替换 $三,$四,$五 $四 $六
   替换 $三,$四,$五 $四,$六
   替换 $三,$四,$五 $四
#>
function 替换 # -repalce operator ( Tìhuàn ) 
{  
  param(
  [Parameter(ValueFromPipeline=$true)]
  $源=$null,
  [Parameter(Mandatory=$true)]
  $中的,
  $为=$null
  )
  # Keep compatible for syntax : Replace $source $oldValue,$newValue
  if( (-not $为) -and ($中的.length -eq 2) )
  {
    $为 = $中的[1]
    $中的 = $中的[0]
  }
  return $源 -replace $中的,$为
} 

