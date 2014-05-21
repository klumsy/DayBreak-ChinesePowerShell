#simple while loop
function 重复 ($做,$当)
{
 if (!($当 -is [scriptblock] ))
 {
   #"Only scriptblocks for the condition 当"
   throw "条件'当'只接受脚本块."
 }
 Invoke-Expression ( "while($当)
 {
  $做
 }")
}
