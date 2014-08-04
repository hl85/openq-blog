#关于WebKit
 
- time: 2012-01-29 10:18
- tags: webkit

---
  你知道都有那些浏览器采用了webkit内核吗？
  前几日跟一个做浏览器的哥们聊到html5本地化，曾说了这么一句话：“我们想做一个基于webkit的框架，使之可以很好的与android、iphone本地化程序结合，类似于phoneGap”。这哥们给我纠错，说：“webKit 不是android的引擎么？”。当时，我回答是基于智能机浏览器的html5框架，此webkit主要是泛指智能系统的浏览器… … 
  之后感觉对于“webkit”的理解存在盲点，于是仔细查了一下，原来，android和iphone上的浏览器果然都基于webkit，webkit包含两个引擎：webcore和jscore（将来做js优化，深入研究会有帮助）。
  分享一下：
  WebKit 是一个开源的浏览器引擎，与之相对应的引擎有Gecko（Mozilla Firefox 等使用）和Trident（也称MSHTML，IE 使用）。同时WebKit 也是苹果Mac OS X 系统引擎框架版本的名称，主要用于Safari，Dashboard，Mail 和其他一些Mac OS X 程序。WebKit 前身是 KDE 小组的 KHTML，WebKit 所包含的 WebCore 排版引擎和 JSCore 引擎来自于 KDE 的 KHTML 和 KJS，当年苹果比较了 Gecko 和 KHTML 后，仍然选择了后者，就因为它拥有清晰的源码结构、极快的渲染速度。Apple将 KHTML 发扬光大，推出了装备 KHTML 改进型 WebKit 引擎的浏览器 Safari。
  WebKit 所包含的 WebCore 排版引擎和 JSCore 引擎，均是从KDE的KHTML及KJS引擎衍生而来，它们都是自由软件，在GPL条约下授权，同时支持BSD系统的开发。所以Webkit也是自由软件，同时开放源代码。
  WebKit的优势在于高效稳定，兼容性好，且源码结构清晰，易于维护。
  尽管Webkit内核是个非常好的网页解释机制，但是由于微软把IE捆绑在Windows里，导致许多网站都是按照IE来架设的，很多网站不兼容Webkit内核，比如登录界面、网银等网页均不可使用Webkit内核。目前来讲，Webkit还不能取代IE内核。
  WebKit 内核在手机上的应用也十分广泛，例如 Google 的手机 Gphone、 Apple 的 iPhone, Nokia’s Series 60 browser 等所使用的 Browser 内核引擎，都是基于 WebKit。
    近期可以考虑专门抽时间研究一下，safari中webkit内核的发展演进情况，对未来做优化一定是有益的。

**扩展阅读：**
1、浏览器引擎分类
      现在浏览器的内核引擎，基本上是四分天下：
Trident: IE 以Trident 作为内核引擎;
Gecko: Firefox 是基于 Gecko 开发;
WebKit: Safari, Google Chrome,搜狗浏览器的高速内核,傲游3 基于 Webkit 开发。
Presto: Opera的内核，但由于市场选择问题，主要应用在手机平台--Opera mini
2、使用webkit的应用平台
      在应用于Mac Os上的Safari之后，Webkit很快被广泛地移植到其他系统平台：
iOS：2007年6月29日，iPhone上市，WebKit进入iPhone OS平台，而且立即成为iPhone OS平台独一无二的排版引擎。
Android：Google 开发的手机操作系统Android中内置的浏览器也是采用的WebKit引擎。
Nokia S60：诺基亚公司将WebKit移植到Symbian S60操作系统中，并开发了基于Webkit的手机浏览器“Web browser for S60”，广泛用于诺基亚、三星、LG等基于Symbian S60操作系统的手机中。
Web OS:Palm 推出第一款基于WebKit的操作系统，Palm Pre是第一款基于该系统的手机产品。
Linux：尽管WebKit的原型K内核是由Qt写成，但Linux下目前最受瞩目的WebKit项目却是Gnome领导的WebKit/Gtk+。随着奇趣科技于2008年6月被Nokia收购，Qt方面也加快了WebKit的“回归”进程。Midori，Google Chrome，GNOME的Epiphany、KDE的Konqueror，Arora是现在Linux系统下主要的Webkit内核浏览器。
Windows：Webkit内核在Windows上发展最晚，Safari(for Windows)，Midori，Google chrome，具有双核模式的傲游3和搜狗浏览器2（高速模式下使用Webkit核心）是最为常见的Webkit浏览器。2009年推出的safari和Chrome以及2010年推出的搜狗浏览器V2.0Beta和傲游3.0beta都使用的webkit引擎完全通过了acid3测试满分！
部分资料引自：百度百科