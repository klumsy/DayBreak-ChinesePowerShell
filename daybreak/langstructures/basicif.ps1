#if -non pipeline simple if
# 如果 Rúguǒ 条件 tiáojiàn 满足 tiáojiàn 就 jiù $否则 fǒuzé
function 如果 ($条件,$就,$否则) 
{
if (!($条件 -is [bool] -or $条件 -is [scriptblock] ))
 {
   #"Only scriptblocks or booleans for the condition 条件"
   throw "条件只接受布尔类型和脚本块." #TODO a syntax with a dictionary and chinese and english messages
   #and options to show the messages in either or both.
 }

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
