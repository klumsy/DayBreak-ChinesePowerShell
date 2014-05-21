#simple while loop
function 重复 ($做,$当)
{
 if (!($当 -is [scriptblock] ))
 {
   #"Only scriptblocks for the condition 当"
   throw "条件'当'只接受脚本块."
 }
  if (!($做 -is [scriptblock] ))
 {
   #"Only scriptblocks for the condition 当"
   throw "条件'做'只接受脚本块."
 }
while(. $当) #preform comparision and execution in the same scope. 
 {
  . $做
 }
}
