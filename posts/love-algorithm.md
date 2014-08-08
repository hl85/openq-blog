#爱情算法

- time: 2006-02-22 14:49
- tags: funny

---
```java
result love(boy, girl)
　　　　{
　　　　if( boy.有房() and boy.有车() )
　　　　{
　　　　 boy.set(nothing);
　　　　 return girl.嫁给(boy);
　　　　}
　　　　if( girl.愿意等() )
　　　　{
　　　　  while(!(boy.赚钱 > 100,000 and girl.感情 > 8 ) )
　　　　  {
　　　　  for( day=1; day <=365; day++)
　　　　  {
　　　　   if( day == 情人节 )
　　　　   if( boy.givegirl(玫瑰) )
　　　　   girl.感情++;
　　　　   else
　　　　   girl.感情--;
　　 
　　　　  if( day == girl.生日)
　　　　  if( boy.givegirl(玫瑰) )
　　　　   girl.感情++;
　　　　  else
　　　　   girl.感情--;
　　　　   boy.拼命赚钱();
　　　　 }
　　　　 }
　　　　 if( boy.有房() and boy.有车() )
　　　　 {
　　　　  boy.set(nothing);
　　　　  return girl.嫁给(boy);
　　　　 }
　　　　 年龄++;
　　　　 girl.感情--;
　　　　 }
　　　　 return girl.goto( another_boy);
　　　　 } 
```