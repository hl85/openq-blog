#使用NSURLProtocol实现UIWebView的离线缓存

- time: 2012-07-10 03:03
- tags: iOS

---
搜索解决方案的时候找到了 Rob Napier 的博文：<a href="http://robnapier.net/blog/offline-uiwebview-nsurlprotocol-588">Drop-in offline caching for UIWebView (and NSURLProtocol) </a>文章介绍了使用NSURLProtocol实现UIWebView的离线缓存的简单实现，你可以在github上下载这个<a href="https://github.com/rnapier/RNCachingURLProtocol">demo</a>的代码。

rob认为无论是“MKNetworkKit”还是”AFCache”实现的缓存都过于复杂，而他想要的是一个简单机制：

1、你使用了UIWebView指向来显示一个有图像嵌入的网站。
2、当你的设备online时，你有正常的缓存算法。
3、当你的设备offline时，你可以显示页面的最后一个版本。

这个demo里做了一个很简单的测试：将cnn.com运行一次，然后再将网络断掉，去浏览这些数据。

现有解决方案：

Matt Gallagher 有一些有趣的想法，使用NSURLCache的子类来实现，但是Rob发现这是不可靠的，尤其是iOS5的HTTP缓存规则十分复杂，在许多情况下如果你不访问服务器便不能获知你缓存的数据是否有效。另外，一些必要的素材如果没有被缓存，那么在离线时前期做的缓存工作就实效了。(辉：<a href="http://openq.cn/nsurlcache-to-achieve-a-little-experience-for-offline-reading/">NSURLCache实现离线阅读的一点小心得</a>我也曾讨论了一些相关问题)

<a href="https://github.com/artifacts/AFCache">AFCache</a>也被认为是一个很好的解决方案（辉：有时间我会对这个开源库进行详细评估，表面上看就是connection、NSURLCache、NSURLProtocol的综合解决方案）。短时间内作者并没有使测试通过，但是AFCache的作者也在文章后边回复说，采纳了Rob的想法，已经提交代码到github上。

要点：
1、尽早注册你的URLProtocol（application:didFinishLaunchingWithOptions:）。
2、NSURLProtocol是NSURLConnection的handler。NSURLConnection的每个请求都会去便利所有的Protocols，并询问你能处理这个请求么（canInitWithRequest： ）。如果这个Protocol返回YES，则第一个返回YES的Protocol会来处理这个connection。Protocols的遍历是反向的，也就是最后注册的Protocol会被优先判断。
3、 当你的handler被选中了，connection就会调用–> initWithRequest:cachedResponse:client:，紧接着会调用–>startLoading。然后你需要负责回调：–>URLProtocol:didReceiveResponse:cacheStoragePolicy:，有些则会调用：–>URLProtocol:didLoadData:, 并且最终会调用–>URLProtocolDidFinishLoading:。你有没有发现这些方法和NSURLConnection delegate的方法非常类似——这绝非偶然！
4、当online的情况下，RNCachingURLProtocol只是负责将请求转发给一个新的NSURLConnection，并且拷贝一份结果给原来的connection。offline时， RNCachingURLProtocol就会从磁盘里载入先前的结果，并将这些数据发回给连接。整个过程只有区区200行代码（不包含Reachability）。
5、这里还有一个有趣的问题，就是当RNCachingURLProtocol创建了一个新的NSURLConnection的，即新的connection也会去找一个handler。 如果RNCachingURLProtocol说可以处理，那么就死循环了。怎么解决呢？通过添加自定义HTTP Header（X-RNCache）来标记这个请求，告诉RNCachingURLProtocol不要再处理这个请求。
6、它可以响应所有的connection，所以你可能需要修改canInitWithRequest：来 选择你要缓存的数据。

另外：并发请求或复杂网络请求的缓存请使用MKNetworkKit（我们也在一个项目中使用了这个类库，非常轻量快捷是ASI的很不错的替代品）。

总结一下：
这项技术不是用来替代AFCache、MKNetworkKit的，他只是用来解决独立的、简单问题的（当然它也可以通过复杂实现来解决复杂问题）。 NSURLProtocol是非常强大的，Rob已经使用它来监听网络流量（如PandoraBoy中的几个<a href="https://github.com/PandoraBoy/PandoraBoy/blob/master/ProxyURLProtocol.h">ProxyURLProtocol</a>类）。它非常值得你将其添加到你的工具箱中。

实例代码下载：https://github.com/rnapier/RNCachingURLProtocol

参见demo中的类文件：RNCachingURLProtocol.m。

一定要看Nick Dowell在评论中回复的对于redirect的解决办法：（Code to fix HTTP redirect handling: <a href="https://gist.github.com/1885821">https://gist.github.com/1885821</a>）

```oc
(NSURLRequest*)connection:(NSURLConnection*)connection willSendRequest:(NSURLRequest*)request redirectResponse:(NSURLResponse*)response{
	if([response isKindOfClass:[NSHTTPURLResponseclass]])
	{
		NSHTTPURLResponse*HTTPResponse=(NSHTTPURLResponse*)response;
		if([HTTPResponsestatusCode]==301||[HTTPResponsestatusCode]==302)
		{
			NSMutableURLRequest*mutableRequest=[request mutableCopy];
			[mutableRequest setURL:[NSURL URLWithString:[[HTTPResponseallHeaderFields] objectForKey:@”Location”]]];
			request=[mutableRequest copy];
			[[selfclient] URLProtocol:self wasRedirectedToRequest:request redirectResponse:response];
		}
	}
	return request;
}
```

如果你有兴趣的话可以读一下我这篇小文：<a href = "http://openq.cn/nsurlcache-to-achieve-a-little-experience-for-offline-reading/">NSURLCache实现离线阅读的一点小心得</a>