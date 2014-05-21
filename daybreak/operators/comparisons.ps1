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
