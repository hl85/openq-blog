#NSURLCache实现离线阅读的一点小心得

- time: 2012-06-19 08:34
- tags: iOS

---

用来实现网页离线缓存（用于离线阅读）的方式比较多，比如：
1、利用html5的cache机制（但是网页cache有大小限制）
2、利用对html5做自定义解析，对dom树分析后请求并存储相关资源。
3、利用NSURLCache（简单，自己写存储，写一二级缓存效率高，空间无限制）
4、利用NSURLProtocol完成缓存工作（由于NSURLProtocol我还没有在实际项目中使用，了解也不深入，暂不介绍）

今天主要针对NSURLCache，记录一些小心得，关键就是两个方法：
1、- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request;
    这个方法主要是用来读取缓存，提供给响应的Request的，因此最好能提供快速的cache数据，否则会引发二次请求（通过网络抓包发现的），这样会给用户带来二倍的流量负担，效率也会明显降低，因此我没有采用网上比较流行的那段代码。
   如果是uiwebview的请求，参数request已经不是你最初调用webview load进来的那个request，已经被封装为mutiableRequest。
2、-(void)storeCachedResponse:(NSCachedURLResponse *)cachedResponse forRequest:(NSURLRequest *)request;
  这个方法是用来存储缓存的，具体什么时候触发存储，我还没有总结出来，但是有一点是可以肯定的，即，并不是所有文件都会被要求存储下来，因此向html、js、css这些关键数据需要做一些手动工作（因为做皮肤，所以我是通过预先加载来缓存css、js的（发现一个符合命名规则的css会主动下载一系列的皮肤样式）。html我是通过单独请求获取html->存储缓存->load到webview来完成的）

 Html的缓存也可以通过js脚本取出html代码来缓存，由于中间我们会对页面做处理，所以没有这样做。

 需要针对status code来判断是否缓存（200到300以内的状态码代表资源请求成功，其他的状态码不能缓存下来），通过单独的connection发起请求也需要判断这个。

 如果需要与其他模块共享缓存只需要采用同样的目录，及命名规则（我采用的对url做md5），存储nsdata，建议最好mimeType的索引页存储下来，这样网页可以与原生客户端使用同样的缓存数据。

 存储成CachedResponse可以保留更多的有效信息，但是这样与其他模块的cache共用就会相对麻烦。
