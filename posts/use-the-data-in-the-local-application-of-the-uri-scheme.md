#本地应用里使用Data URI scheme
 
- time: 2012-03-26 17:18
- tags: front end

---
之前跟钟小声一起探讨过关于Data URI scheme 数据传递的问题，就是从objective-c中调用uiwebview或safari显示刚刚处理的图片。UIWebView里边采用这种Data URI scheme很合适，但是oc调用safari就比较麻烦了（url长度有限制），解决方案是自己起一个http的服务，然后传递http://localhost:[port]/[yourpage.html] ，([port]替换成相应的端口，[yourpage.html]替换成相应的页面)，这个时候你怎么显示图片都很容易了。这里有一个问题http service库很庞大，实际上你不用实现完整的http service，只要写一个简单的socket监听就ok了，满足需求就好（当然这超出了本文讨论的范围，可以稍后单独发帖讨论）。

另外，今天刚好看到有人（facebook）在iPhone客户端里，使用了用html写的loading页和error页（貌似菊花动画是用css3实现的，稍后再确定）

Data URI scheme的html嵌入式，形如：

```html
&lt;img src=”data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==”&gt;
```

如此，在html中嵌入，实际上是将图片进行base64处理，直接写到网页里，从而减少一次网络请求加快页面显示。当然在app中使用<img src=”data:image/png;base64,%@”/>这样的办法显示loading页和error页也是很方便的（facebook是这么干的）

还有一种是直接通过url传递，你可以将以下代码贴到地址栏，回车看效果（一个小红点儿;）。
```html
data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==
```

这样可以实现跨域传输数据（如objcetive-c向safari），但是，无奈你也得注意url的长度限制。

简单科普一下Data URI scheme:

Data URI scheme是在RFC2397中定义的，目的是将一些小的数据，直接嵌入到网页中，从而不用再从外部文件载入。比如上面那串字符，其实是一张小图片，将这些字符复制黏贴到火狐的地址栏中并转到，就能看到它了，一张1X36的白灰png图片。
在上面的Data URI中，data表示取得数据的协定名称，image/png 是数据类型名称，base64 是数据的编码方法，逗号后面就是这个image/png文件base64编码后的数据。
目前，Data URI scheme支持的类型有：

data:,文本数据
data:text/plain,文本数据
data:text/html,HTML代码
data:text/html;base64,base64编码的HTML代码
data:text/css,CSS代码
data:text/css;base64,base64编码的CSS代码
data:text/javascript,Javascript代码
data:text/javascript;base64,base64编码的Javascript代码
data:image/gif;base64,base64编码的gif图片数据
data:image/png;base64,base64编码的png图片数据
data:image/jpeg;base64,base64编码的jpeg图片数据
data:image/x-icon;base64,base64编码的icon图片数据

base64简单地说，它把一些 8-bit 数据翻译成标准 ASCII 字符，网上有很多免费的base64 编码和解码的工具，在PHP中可以用函数base64_encode() 进行编码，如echo base64_encode(file_get_contents(‘wg.png’));
目前，IE8、Firfox、Chrome、Opera浏览器都支持这种小文件嵌入