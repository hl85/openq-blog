#Mac开发问题集锦(不定期更新)

- time: 2015-10-28
- tags: 集锦

---

2015-10-28

- MAC上提示您需要安装Java SE 6运行环境才能打开Pycharm、WebStorm等JetBrains系IDE。

	- 提示符下跳转到[IDE Name].app/Contens下，打开Info.plist
	- 修改 ***JVMVersion*** 值: ***1.6\**** -> ***1.7\****


