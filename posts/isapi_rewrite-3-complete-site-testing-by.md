#ISAPI_Rewrite 3 完全版本站测试通过

- time: 2012-07-18 10:57
- tags: 后端
- description: ISAPI_Rewrite 3 完全版本是收费的，但是朋友做的一个小站还没有盈利，所以帮他找了一个破解的，实际测试没有问题，现在分享给大家。

---
ISAPI_Rewrite 3 完全版本是收费的，但是朋友做的一个小站还没有盈利，所以帮他找了一个破解的，实际测试没有问题，现在分享给大家。
我的环境：windows 2003, IIS 6, fastCGI, php 。

操作步骤：
1、下载破解文件：
http://pan.baidu.com/s/1pJ1AO2J/
2、去官方下载 ISAPI_Rewrite 3 完全版。
http://www.helicontech.com/download-isapi_rewrite3.htm
3、用官方版本安装好以后，用附件中的两个文件同名覆盖。
4、在安装目录下找到 httpd.conf 文件。输入以下内容：
RegistrationName= coldstar
RegistrationCode= 2EAD-35GH-66NN-ZYBA
重起IIS即可。

rewrite如果不起作用，原因可能有二：
1、规则写错了（这个有点废话，但确实最常见的）可以使用自带的规则检测器测试一下（可以参照帮助文档）。
2、权限。.htaccess文件需要IIS进程用户的访问权，一般为iis_wpg或Network Serivce可读。对于站点设置了独立权限的朋友，这个错误的可能性比较大。

更多资料请参考：http://blog.csdn.net/keke0307/article/details/7029658
