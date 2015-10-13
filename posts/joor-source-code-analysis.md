#jOOR源码设计简析

- time: 2015-10-13 10:17
- tags: Java,Android,Coding

---

大家都知道面向对象的一个基础工作就是将数据类型化，这在处理复杂的概念体系或者维护系统长期健康发展是非常必要的。但是在实际开发过程中，还有很多场景通过非设计模式（或者说非常见设计模式）的办法可以实现非常优雅而且灵活的代码。前几天看到一篇文章**[Java 反射最佳实践](http://www.imooc.com/article/1518)**文章介绍了一个非常优雅的反射解决方案：**[jOOR](https://github.com/jOOQ/jOOR)** 

Java中写反射竟然可以这么简单——

```Java
// All examples assume the following static import:
import static org.joor.Reflect.*;

String world = on("java.lang.String")  // Like Class.forName()
                .create("Hello World") // Call most specific matching constructor
                .call("substring", 6)  // Call most specific matching substring() method
                .call("toString")      // Call toString()
                .get();                // Get the wrapped object, in this case a String
                
//Comparison
Employee[] employees = on(department).call("getEmployees").get();

for (Employee employee : employees) {
  Street street = on(employee).call("getAddress").call("getStreet").get();
  System.out.println(street);
}
```
这么漂亮的设计一定得读一下[源码](https://github.com/jOOQ/jOOR/blob/master/jOOR/src/main/java/org/joor/Reflect.java)。
作者的实现代码同样漂亮，简单摘取一二：

1、私有化构造器，从而强制用户使用静态on方法（是不是想到了单例）

```Java
// Constructors
    private Reflect(Class<?> type) {
        this.object = type; 
        this.isClass = true; //通过这个开关实现object与class的结构复用，除了on的复用还有类级别方法、实例级别方法的复用（见3）
    }

    private Reflect(Object object) {
        this.object = object;
        this.isClass = false;
    }
```
 
 2、对外提供的接口就是这两个了，通过返回Reflect实例来实现链式调用（与单例不同的是这里每次都创建一个实例，所以从实际需求出发，就不存在多线程问题了）
 
 ```Java
     public static Reflect on(String name) throws ReflectException {
        return on(forName(name));
    }
    public static Reflect on(String name, ClassLoader classLoader) throws ReflectException {
        return on(forName(name, classLoader));
    }
 
 ```
 
 3、Reflect的实例方法同样都通过返回对象来实现链式风格调用。而具体实现中，每次链式调用返回的对象都是Reflect，响应级别的目标对象存储在Reflect.object中，这种『递归』式的复用设计让人拍案叫绝。
 
 ```Java
 	  //创建一个目标对象的wapper，因为很多反射场景中你根本拿不到调用对象的类型（比如系统私有类）所以这么包装不只是为了链式调用，还有实际场景考虑——一箭双雕。
    public Reflect create() throws ReflectException {
        return create(new Object[0]);
    }
	 //目标对象方法调用
	 //需要传参可以调用这个：call(String name, Object... args) throws ReflectException 
    public Reflect call(String name) throws ReflectException {
        return call(name, new Object[0]);
    }
    
    //获得目标实例<T>
    public <T> T get() {
        return (T) object;
    }
    //获得目标对象的属性
    public Reflect field(String name) throws ReflectException {
        try {
            Field field = field0(name);
            return on(field.get(object));
        }
        catch (Exception e) {
            throw new ReflectException(e);
        }
    }
 ```
 
 4、神奇的抽象代理机制：通过代理类就可以在拿不到目标类型的时候类型化调用了，这里展示一下调用demo吧，这个机制算是整体机制的补充，具体实现还请异步自己看源代码咯。
 
 ```Java
 public interface StringProxy {
  String substring(int beginIndex);
}

String substring = on("java.lang.String")
                    .create("Hello World")
                    .as(StringProxy.class) // Create a proxy for the wrapped object
                    .substring(6);         // 【重点】Call a proxy method
 ```
 
 忽然想到其实其他语言里边也需要类似的机制，比如反射更加灵活的oc，哪天有时间可以尝试搞一搞。