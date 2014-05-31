# -lt,-le,-eq,-ge,-gt
比较 $三 小于 $四
比较 $三 小于等于 $四
比较 $三 不等于 $四
比较 $四 大于 $三
比较 $四 大于等于 $三

# contains
比较 $三,$四,$六 包含 $四

# not contains
比较 $三,$四,$六 不包含 $五

# like
比较 'mistool' 相似 '*tool'

# not like
比较 'mistool' 不相似 '*too'

# match
比较 'mistool' 匹配 'to{2}l'

# not match
比较 'mistool' 不匹配 'to{3}l'

# in
比较 $四 在 $四,$六

# not in
比较 $五 不在 $四,$六

# replace
替换 -源 $三,$四,$五 -中的 $四 -为 $六
替换 $三,$四,$五 $四 $六
替换 $三,$四,$五 $四,$六
替换 $三,$四,$五 $四
