#使用Paros监控终端发出的HTTP请求
 
- time: 2012-02-26 17:18
- tags: 工具

---

***注***：实际上Paros是一个跨平台抓包工具，其原理是通过pc端开放代理->终端设置pc开放的代理从而实现终端流量经过pc端后进行抓包。本文主要介绍mac通过wifi共享热点来抓包，实际上只要保证pc与终端同时在一个局域网即可实现抓包。另外，如果通过mac共享来抓包的话，还有更多选择比如：HttpScoop、Wireshark，甚至命令行工具tcpflow。

电脑上的许多软件可以监控浏览器发出的HTTP请求, iPhone上有许多连网程序但没有自带软件可以实现监控, 为了方便测试这些请求是否正确而省去在程序中记录请求日志并逐一查找的麻烦, 可以利用Paros这个监控软件来实现. 

 以下是实现在Mac上监控iPhone发出的HTTP请求的具体步骤: 

1. 将Mac机器的以太网共享给无线局域网: Mac上: 系统偏好设置->共享->Internet 共享, 将”以太网”共享给”AirPort” 

2. 查看无线局域网IP: 返回->网络->AirPort, 查看到AirPort具有IP地址”169.254.242.107″ 

3. 设置Paros本地代理: Paros->Tools->Options->Local proxy, Address填上”169.254.242.107″, 端口默认为8080 

4. 设置iPhone上网代理: iPhone上: 设置->无线局域网->选上Mac机器共享出去的网络->按”Details”箭头->Http代理->手动->服务器填”169.254.242.107″, 端口填”8080″ 

5. 查看HTTP请求: iPhone打开访问任何连网程序, 可以在Paros的Sites下看到访问的网站, 右边可以选Reques/Response等信息.

源码地址：http://sourceforge.net/projects/paros/  
