#Facebook、PhoneGap、MoSync跨平台架构尿点小窥（js框架角度）
 
- time: 2012-03-22 03:48
- tags: hybrid

---

今晚研究了一下从Facebook iPhone app中搞到的bridge.js，趁热对Facebook、PhoneGap、MoSync的js框架进行一个简要的对比。首先，个人认为程序架构和设计模式的关键就是：1、需求或领域（Domain）的粒度。2、对变化点的封装–标题中的‘尿点’就是指的这亮点了。另外，之所以没有在 Appcelerator 上花时间，是因为一来这玩意不开源，二来我还没有看到除了ide外其他可借鉴的东西。



下面是三个平台的Js框架代码下载及对比（除了phoneGap其他两个的代码都是抠出来的，不仔细找很难找到）：

1、Facebook –> bridge.js 下载 (线上app包里有一个bridgekit.bundle的资源包)

说明：私有框架（只针对facebook自己产品），跨平台特点：目前产品采用的是Html5页面 + 原生页面的模式，部分页面或界面采用了Html5，页面加速度优化的相当成功（哥们就是想学习它的页面加速度解决方案才各种抓包、破解的），原生导航机制，各种互调。

js->尿点：

1）短短200来行代码，实现了原生类和js类的转换（Mapping）。这个实现方案的典型特点是灵活，原则上来说js脚本可以掉用所有的原生代码（安全漏洞有木有！！！本人就准备动过这个文件对facebook的app进行抓包，https加密哥们绕开你啦，哈哈！）

2）看这段代码（第100行）

var url = ‘http://’+(location.host||’localhost‘)+’/__bridge__/’+__token+’/'+__generateToken();

跟phoneGap 不同它是通过起了一个http服务实现的html5和原生代码的通信管道（很大概率上是这样，等我抓到的location.host变量的值了之后才能最终确定。也就是还有下文，敬请期待，哈哈！

2、PhoneGap –>  phonegap-1.3.0.js下载

说明：公共框架（开源编程框架），跨平台特点：主要应用一般都采用Html5 App + 原生壳模式，目前社区热度最高的开源跨平台解决方案（还有一个解决方案，），通过开发插件实现对原生调用的扩充，默认不支持原生导航，互调一般也是限于重力加速度、定位、照相等原生设备级的。

js->尿点：

1)代码量非常大（4000多行有木有！！）实现了约定了并且在配置文件中开启的原生接口和html5的Mapping（看这么拗口就知道——相当安全），实现了设备能力级的互调。插件式架构，可以通过编写插件来扩展互调的范围，比如你自己写一个支持回调的原生输入框，遵照其plugin规范就可以被js调用到了。这个框架代码很少，架构清晰，SDK非常的产品化。当然也就没有facebook的灵活了。还有，也没有Appcelerator IDE这样牛x的调试工具。

2）看这段代码：

PhoneGap.createGapBridge = function() {
gapBridge = document.createElement(“iframe”);
gapBridge.setAttribute(“style”, “display:none;”);
gapBridge.setAttribute(“height”,”0px”);
gapBridge.setAttribute(“width”,”0px”);
gapBridge.setAttribute(“frameborder”,”0″);
document.documentElement.appendChild(gapBridge);
return gapBridge;
}

它是通过给iframe设置一个url出发webview的导航事件实现内外互调的(这里说的是针对iOS平台的机制)，这个机制很轻量也很灵活。这个之后还有一个消息队列机制，这个我会专门写文章详细说明这个东东，有点意思，但我还要评估这个东西是不是画蛇添足了（包括使用iframe)。

3、MoSync –> mosync-bridge.js下载（深入认识MoSync也是因为新版Facebook中用到的bridge.js）

说明：公共框架（开源、提供开发Ide——很类似Appcelerator，但开发体验差很多），跨平台特点：Mosync支持平台相当的多，毕竟人家使用C++开发的底层架构，标榜的是效率很高，但是通过对其工具、及学习成本等分析粗浅认为，即使你很迷恋单独的ide，想用这玩意做一般产品还不如用Appcelerator（跑个题Appcelerator的Titanium IDE可以在iPhone模拟器上调试js，够酷吧！）。当然，你要研究代码或底层架构，这个再好不过了，一来框架封装的轮子够多，二来开源，github有下（100+M的代码）。

js->尿点：

1）框架比较乱，有界面也有机制的东西，不是很干净，但代码量同样很少，架构封装点不是很明确，因为分析的是它二点几的版本的js框架所以就重点说说互调机制。实际上，看到它的文档里，有大量的内容标注了和phoneGap兼容，或许3.0以后这个东东会废弃掉以前的c++代码（100多兆啊！！），个人判断有不同观点可以留言讨论。

2）还是上代码：
```javascript
if (mosync.isAndroid)
{
prompt(data, “”);
}
else if (mosync.isIOS)
{
rawMessageQueue.push(data);
window.location = “mosync://DataAvailable”;
}
else if (mosync.isWindowsPhone)
{
window.external.notify(data);
}
```

一家活三个平台的机制都暴露了，研究跨平台机制的同学看到这个爽了，哈哈！！！和phoneGap的机制如初一折，当然是谁的创意以后有精力在调研，基本就这些了，过两天再分析一下iOS、Android、Phone 7不同平台Html5互调的尿点。