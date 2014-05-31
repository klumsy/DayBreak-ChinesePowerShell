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
