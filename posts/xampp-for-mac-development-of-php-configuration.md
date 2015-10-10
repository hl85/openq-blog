#XAMPP for MAC开发PHP的若干配置

- time: 2012-11-01 18:22
- tags: 后端
- description: 在学iOS的时候也学习了一下php（mono和java不是我的首选，因此我先后学习了php和python的皮毛，以前一直用来做主角本语言的perl也被我抛弃了），配置xampp遇到了一些问题，现在总结如下

---
在学iOS的时候也学习了一下php（mono和java不是我的首选，因此我先后学习了php和python的皮毛，以前一直用来做主角本语言的perl也被我抛弃了），配置xampp遇到了一些问题，现在总结如下：

1、xdebug 不成功的问题。
xdebug不能设置成extension，应该设置成zend_extension。
以下是我在php.ini里边的设置：
;xdebug
;extension=xdebug.so
zend_extension="/Applications/XAMPP/xamppfiles/lib/php/php-5.3.1/extensions/no-debug-non-zts-20090626/xdebug.so"
xdebug.remote_enable=on
xdebug.remote_handler=dbgp
xdebug.remote_host=localhost
xdebug.remote_port=9000
xdebug.profiler_enable=1
xdebug.profiler_output_name=xdebug.cachegrind-out.%s.%p
xdebug.remote_log="/applications/XAMPP/xamppfiles/logs/xdebug.log"
xdebug.idekey="netbeans-xdebug"
设置完了重启如果还不成功，可以进行以下设置：
打开或创建 ~/.bash_profile 并且输入以下内容:（参照：http://stackoverflow.com/questions/3144485/xdebug-not-loading-not-found-in-phpinfo-after-apache-restart）
#add xampp binaries to path
export PATH="/Applications/XAMPP/xamppfiles/bin:/Applications/XAMPP/xamppfiles/lib:/Applications/XAMPP/xamppfiles/lib/php/php-5.3.1/extensions/no-debug-non-zts-20090626:$PATH"
关掉终端，然后重启xampp：
sudo /Applications/XAMPP/xamppfiles/xampp stop
/Applications/XAMPP/xamppfiles/xampp start
应该就可以了，如图：

启动netbeans就可以调试了。

2、ProFTPD启动不成功的问题。
如果在日志里看到：
XAMPP: Starting ProFTPD.../Applications/XAMPP/xamppfiles/xampp: line 184: /Applications/XAMPP/xamppfiles//var/proftpd/start.err: No such file or directory
fail.
Contents of "/Applications/XAMPP/xamppfiles//var/proftpd/start.err":
cat: /Applications/XAMPP/xamppfiles//var/proftpd/start.err: No such file or directory
这样的错误，解决方法也很简单，执行如下命令：
sudo mkdir /Applications/XAMPP/xamppfiles/var/proftpd/
touch /Applications/XAMPP/xamppfiles/var/proftpd/start.err
sudo /Applications/XAMPP/xamppfiles/xampp fix_rights

3、还有一个问题，我还没有解决，就是我想将php版本更新为最新版本，找到解决办法再更新此贴。
