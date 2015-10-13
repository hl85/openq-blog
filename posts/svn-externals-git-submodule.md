#如何通过svn,git进行优雅的代码集成

- time: 2014-09-12 12:30
- tags: SVN,Git

---

谈到代码集成，大部分人可能会想到各种的CI Server，比如CruiseControl、Hudson、Jenkins种种。这些持续集成的工具基本上都是将源码管理工具、构建工具、测试工具等集成起来通过统一的配置来实现多项目、松耦合、自动化、透明化的构建目标的。而深入到某个项目，人们通常是通过maven或一段shell脚本来管理代码间的复杂依赖关系及构建顺序的。很多场景下maven并不好用，比如构建iOS程序时。

我们公司使用的Jenkins构建iOS、Android程序时会调用一大段Shell脚本，项目中如果存在代码依赖（比如其他部门开发的SDK），则通过约定目录层次，通过shell 按顺序执行SVN命令分配签出代码后执行构建命令——这么干很丑！一方面，团队成员在每个人的开发环境上都要进行很多约定的设置才能开始工作。另一方面，外部依赖代码的版本不好管理。因此，通过研究，我决定将这些外部代码通过 svn externals来实现。不但开发环境配置简单了，Jenkins构建的代码也精简了不少。同样，我对我的静态博客中皮肤的依赖也改成了git submodule的方式。——这种动态关联，让人感觉轻松不少。

一、svn externals：

```bash
cd /path/to/your/codedir
svn pedit svn:externals .
```

在打开的窗口中填入要依赖的外部代码路径，形如

```bash
localDir -r0000 http://the/outer/svn/url
```

其中，localDir -> 你的代码签出到当前路径后存放的目录名。-r0000 -> 限定svn版本号，可不填则将签出最新代码。
可以输入多行，部署更多的外部依赖。

:wq 保存后继续：

```bash
svn up
svn ci -m 'add externals'
```

再检查一下依赖是否已经都设置好，是否可以build通过，就可以通知其他人签出了。

参考：<a href="http://defencew.blog.163.com/blog/static/5795194120118282336825/">svn externals 引入外部分支目录 </a> <a href="http://blog.csdn.net/echoisland/article/details/6584875">学会使用svn:externals</a>

二、git submodule：

以下是本博客代码如何引入主题的脚本：

```bash
cd /path/to/your/blog
mkdir themes
mkdir themes/puresam
git submodule add git@github.com:hl85/catsup-theme-puresam.git themes/puresam
git add .
git commit -m "Add submodule puresam"
git submodule init
git push
```

参考：<a href="http://www.josephj.com/entry.php?id=342">Git Submodule 的認識與正確使用！</a>
