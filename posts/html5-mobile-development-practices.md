#HTML5的移动开发实践

- time: 2012-03-10 03:03
- tags: front end

---
<p>如果你阅读稍微涉及前端科技的博客，那么你肯定每周都有可能看到关于HTML5的报道。虽然，这套新web标准没有强大到给你制造某个先进的家用电器，但是它的新特性的确可以帮你创建强大的应用程序，仅仅是使用html,css和javascript（当然，如果后端使用rails或者node.js的话，火力会更猛）。这篇文章主旨就是介绍关键概念及HTML5的牛逼特性，还有一些更牛逼的设置（当然是移动相关的了，牛皮吹的够大）。</p><p></p><h3>浏览器兼容性</h3><p>开发一个web应用最大的痛苦莫过于确保您的应用程序是与目前使用的各种浏览器兼容。&nbsp;幸运的是，在移动世界中这不是一个大问题（观点很新颖吧，我们继续）。&nbsp;因为比起换电脑来人们往往更频繁的更换新手机，因为用户群体相对年轻，旧的智能手机很快就被市场淘汰。另外，iPhone、android内核都是webkit，所以这也给兼容性创造了条件。当然，处于市场考虑，你要支持更多的设备的话，还是要使用真机测试，而不是模拟器。不过，随着标准的完善和设备性能的提升，适配的复杂度将会逐步降低的。</p><h3>Viewport</h3><p>当你用移动设备浏览一个互联网网页，这个网页在你的浏览器里是被缩放了的，这是浏览器为了让你看到网站全貌做的简单自动适配（缩放）。当然，你想看具体内容也可以再放大。不过，如果你正在针对智能手机设计网页，那么viewport的定义将是非常有意义的（viewport meta tag）：</p><p>    <span style="font-family: Consolas , Monaco , monospace;font-size: 12.0px;line-height: 18.0px;white-space: pre;">&lt;meta name="viewport" content = "width=device-width”&gt;</span></p><p>    </p><p>        </p><p>&nbsp;这个宽度通常设置为设备屏幕宽度，因此，网页就没有必要再被浏览器默认缩小或放大了。你肯定就想禁用缩放行为，从而使用户不能无意中放大或缩小页面，使其产生扭曲变形。实现这个目的，你只需要将&nbsp;user-scalable 设置为no：</p>        <p>            &lt;meta name="viewport" content = "width=device-width , &nbsp;user-scalable=no"&gt;            一些网站的移动版将页面宽度设置为320，这是为什么呢？因为这是iPhone的宽度。当然为了为更多用户带来更好的体验，你最好将宽度设为            device-width，320不靠谱。                            <a href="http://openq.cn/wp-content/uploads/2012/03/A4jFz.png"><img class="alignnone size-full wp-image-496" src="http://www.appfanr.com/wp-content/uploads/2012/03/A4jFz.png" alt="" width="610" height="436"></a>                        &nbsp;让你的网页使用正确的大小固然很nice，但是，下文将要提到的HTML5缓存（使用manifest）及存储特性，将使你能够构建全功能离线站点。在信号不是非常稳定的无线环境中，离线能力在用户体验中将承担相当的分量。            </p><h3>HTML5 Caching</h3>            <p>HTML5 Caching 允许用户在没有网络连接的情况下浏览之前浏览过得内容，当然也不光是在没信号的时候可以浏览这一个好处，使用缓存还可以减少很多的连接请求，降低数据传输量。</p>            <p>设置缓存，你可以通过在每个网页的html标签中设置manifest文件来实现：</p>            &lt;html manifest="/cache.manifest"&gt;            这是个文本文件，内容以&nbsp;“CACHE MANIFEST”开始，下面列举需要缓存的文件：            CACHE MANIFEST/mystyle.css/scripts.js/logo.jpg            这样这些文件就可以被离线使用了，只是这么一长串文件列表有时候也会成为陷阱，下面我将试图整理相关的要点：            首先最重要的是，你的网站将默认缓存最新的文件，这意味着，即使你刚刚访问的文件已经改变了，你的浏览器还是显示的老页面，直到这个页面被刷新（或者通过javascript通知更新）。事实上，更严重的是大部分的web server都会告诉客户端浏览器使用缓存，这样同步问题就尤为凸显。当你开发网页的时候，一定要在服务器上设置不要缓存manifest,这样你才能看或调试到你刚刚更新的网页。            另一个大问题是，浏览器如何管理下载过程。如果浏览器监测到manifest更改了，它将重新下载页面上使用的所有文件。这个过程非常昂贵，而且如果其中的单个文件不能下载，浏览器会放弃更新和加载以前的缓存。这个时候浏览器不会抛出任何错误，但是您可以通过javascript抛出异常清单：            $(function() {  $(window.applicationCache).bind("error", function() {    alert("Cache: update failed");  });});            现在你的网站已经被缓存了，并且可以很好的工作了。那么，这样就可以launch了吗？恐怕不行。这种caching技术只能在缓存静态文件的需求下工作正常，但是如果你的网页是动态创建的，或者经常改变的（大多数网页都是这样），它就不能正常工作了。这是因为除非缓存更新了，否则你看到的还是老网页，而不是新内容页。解决办法也很简单，就是当有新内容（或改动）的时候，更新manifest文件。当然正如前文我们讨论的，如果你的网站经常更新，这么做的代价是非常昂贵的。那咋整捏？解决办法就是使用jQuery建立动态模版页面。            <h3>jQuery 模板</h3>            <p>最好的做法是通过JavaScript模板来填充内容。 使用这种方式，内容不是HTML页面的一部分，因而是不会记录到缓存的manifest里。&nbsp;对于这一点，你需要下载jQuery和jQuery的<a href="http://rrurl.cn/phZmw2">模板插件</a>，并添加到您的应用程序&nbsp;。</p>            <p>使用这些模板有三个步骤：</p>            <ol>                <li>定义模板。</li>                <li>定义集合。</li>                <li>告诉jQuery来填充模板的页面。</li>            </ol>            <h4>下面是一个简单的博客应用的一个例子。</h4>            <p>1.&nbsp;&nbsp;定义模板：</p>            <p>                </p><p>                    &lt;script id="post_template" type="text/html”&gt;&lt;div&gt;&lt;h2&gt;${Name}&lt;/h2&gt;&lt;p&gt;${Body}&lt;/p&gt;&lt;/div&gt;&lt;/script&gt;                </p>            <p></p>            <p>2.&nbsp;定义数据集合（以下使用JSON）。</p>            <p>                </p><p>                    &lt;script&gt;var posts = [{ Name: "First!", Body: "This is pretty cool" },{ Name: "Another post", Body: "This is pretty cool" },{ Name: "Yet another blog post", Body: "This is pretty cool" }];&lt;/script&gt;                </p>            <p></p>            <p>3.&nbsp;告诉jQuery使用模板填充页面。</p>            <p>                </p><p>                    &lt;script&gt;$( "#post_template" ).tmpl( posts ).appendTo( "#blog_posts" );&lt;/script&gt;&nbsp;…&nbsp;&lt;body&gt;&nbsp;&lt;div id="blog_posts"&gt;&lt;/div&gt;&nbsp;&lt;/body&gt;                    虽然这个内容是通过JavaScript加载，但它不是动态的，它只是在页面上定义的。&nbsp;对于动态内容，我们需要使用服务器提供的JSON接口。&nbsp;假设我们的博客应用程序提供给了我们这样的JSON接口：                    http://www.yourhost.com/.../posts.json                    我们会告诉jQuery对以上网站发送一个JSON请求，然后用返回的数据来填充页面：                    &lt;script type="text/javascript"&gt;$.getJSON('/posts.json', function(data) {$( "#post_template" ).tmpl( data ).appendTo( "#blog_posts" );});&lt;/script&gt;                    我们还需要修改模板，以便它可以处理JSON元素，post.body对应文章的内容，post.name对应文章的标题：                    &lt;script id="post_template" type="text/html"&gt;&lt;div&gt;  &lt;h2&gt;${post.name}&lt;/h2&gt;  &lt;p&gt;${post.body}&lt;/p&gt;&lt;/div&gt;&lt;/script&gt;                    现在，你的博客数据已经不是缓存在manifest的静态内容了，而是通过jQuery动态跟服务器获取的。然而，这样只有我们的手机有网络连接的时候，网页才能工作了。是不是感觉进了2步却退了3步？别着急，请相信我，我们马上就搞定一个HTML5 mobile app了。我们只需要实现最后一个HTML5接口，本地存储（Local Storage）。                    </p><h3>本地存储（Local Storage）</h3>                    <p>关于本地存储的细节，辉郎准备在单独的文章里详细介绍，这里尽量简化到初学者容易接受的程度。</p>                    <p>本地存储实际上是通过浏览器实现的key-value的存储。通过它，我们可以实现将文本存储到本地，并在稍后重新调用到。在这里，我们使用它来存储JSON，所以我们可以填充博客文章——即使我们没有连接到服务器。</p>                    <p>虽然我们可以手工编写，但是这里有一个很牛x的插件帮我们管理整个过程。&nbsp;jQuery的离线插件，可以在服务器不可用的时候使用本地存储的内容。收到新鲜的内容，它会将其存储存到本地（local storage)。</p>                    <p>点击连接下载此插件：&nbsp;<a href="http://rrurl.cn/fSBV1M">jQuery-Offline</a>                    </p>                    <p>为了使用这个插件，我们将调用的getJSON方法改为retrieveJSON。&nbsp;我们还要做一个小的改动， 后者将执行两次，一次从缓存中抽数据，再次从服务器获得新的内容。&nbsp;这将导致文章出现两次，如果我们只是简单的网页面上追加文章数据的话。</p>                    &lt;script type="text/javascript"&gt;$.retrieveJSON('/posts.json', function(data) {$( "#blog_posts" ).html($( "#post_template" ).tmpl( data ));});&lt;/script&gt;                    这样这个blog程序就可以以正确的页面大小离线浏览了！你可以在这里下载这个Demo：<a href="http://rrurl.cn/9hMX7x">离线博客</a>&nbsp;。                    <p>&nbsp;</p>                    <p>英文参考：<br>Mobile development with HTML5</p>                                 