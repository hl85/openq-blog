#Hello, Baby!
 
- time: 2014-07-15 10:18
- tags: thisBlog

---
你好，宝贝儿！
准备用<a href="https://github.com/whtsky/catsup">Catsup</a>写点东西，被那些复杂程序玩儿残了，自己的清净之地就用**MarkDown**啦    ~~
<strong>用vim写东西好有古感哟~~</strong>

 ```python
 	print("漂漂漂漂,漂~亮!")
 ```
 
 Catsup有两个问题：

1、catsup deploy 参数并没有达到我要的效果，没有提交到hl85.github.io上而是提交到了openq-blog上。（很显然配置参数没有生效）。理论上应该自动提交到两个repo上一个是编辑源。现在暂时通过shell脚本解决。**已解决**
2、SealScript引用了google的字体(themes\sealscript\templates\layout.html)，还有一个twitter的js(themes\sealscript\templates\post.html)导致页面展现缓慢。按照文档说明我将这个theme下载下来合并到编辑源，注释掉了这两部分代码，重新build，现在查看网页源文件可以看到访问速度已经提上来了。**已解决**
3、catsup server有监视写作路径并动态生成，但是生成后没有刷新web server的缓存（etag都没变），导致生成了，扔不能在浏览器预览。现在通过shell实时push到hl85.github.io上了，可以在这个路径下实时浏览，算是解决了。**已解决**

针对这个博客要做的：

1、将appfanr没有遗失的部分blog整理迁移过来。
	- 人人（***完成***）
	- 豆瓣（***完成***）
	- qq空间（***完成***）
	- 新浪（***完成***）
	- cnblogs（***完成***）
2、SealScript，这个风格我还不是很满意。通过学习<a href="http://purecss.io/">purecss</a>的博客<a herf="http://purecss.io/layouts/blog/">Demo</a>（响应式）重新定义了一个还不够完善，但是再深入处理就要修改catsup源代码了。**完成**
3、把最近关注的问题都写出来。**进行中**
4、学习YAML，让界面表达更丰富一点。**完成**
5、将openq.cn绑到这个域名下，将appfanr.com（以后就不在appfanr写博客了）301到openq.cn。利用FREEHOSTING.COM提供的免费服务解决[参见:<a href="/cloud-cant-do">云引擎做不到</a>]。**完成**
6、9.12新增任务，通过修改catsup，让过程更顺畅（发布流程）、界面更美观（智能简介、多色标签、图片压缩处理等）。**未启动**
