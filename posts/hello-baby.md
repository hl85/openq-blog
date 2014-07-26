#Hello, Baby!
 
- time: 2014-07-15 10:18
- edit: 2014-07-26 16:04
- tags: this blog

---
你好，宝贝儿！
准备用Catsup写点东西，被那些复杂程序玩儿残了，自己的清净之地就用**MarkDown**啦    ~~
<strong>用vim写东西好有古感哟~~</strong>


 ```python
 print("漂漂漂漂,漂~亮!")
 ```
 
 Catsup有两个问题：
 1、catsup deploy 参数并没有达到我要的效果，没有提交到hl85.github.io上而是提交到了openq-blog上。（很显然配置参数没有生效）。理论上应该自动提交到两个repo上一个是编辑源，一个是发布源——有时间再研究catsup的源码。**未解决**
 2、SealScript引用了google的字体(themes\sealscript\templates\layout.html)，还有一个twitter的js(themes\sealscript\templates\post.html)导致页面展现缓慢。按照文档说明我将这个theme下载下来合并到编辑源，注释掉了这两部分代码，重新build，现在查看网页源文件可以看到访问速度已经提上来了。**已解决**
 3、catsup server有监视写作路径并动态生成，但是生成后没有刷新web server的缓存（etag都没变），导致生成了，扔不能在浏览器预览。**未解决**
 
 针对这个博客要做的：
 1、将appfanr没有遗失的部分blog整理迁移过来。
 2、SealScript，这个风格我还不是很满意，抽时间自己再整理一份。
 3、把最近关注的问题都写出来。