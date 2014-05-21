#simple do-while loop
function 先重复 ($做,$当=$false)
{
 if (!($当 -is [scriptblock] ))
 {
   #"Only scriptblocks for the condition 当"
   throw "条件'当'只接受脚本块."
 }
 Invoke-Expression ( "do{
  $做
 }while($当)")
}
