#simple do-while loop
# FIRST REPEAT 先重复 Xiān chóngfù DO $做 Zuò WHEN $当 Dāng
function 先重复 ($做,$当={$false})
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
 do{
  . $做
 }while(. $当)
}
