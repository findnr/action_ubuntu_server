# action_ubuntu_server
使用actions zerotier创建一台可以在本地远程连接的的ubuntu虚拟机，免费使用6小时，服务器配制为4核16G内存，创建的服务器就可以配制一些开发环境，下次使用时启动就可以了。
# 第一步
- https://www.zerotier.com 注册一个帐号
- 然后添加一个网络节点
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/99241914-6469-4a7c-a981-a1cfcf5621ef)
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/269d0f07-0987-4de6-b0bd-db0a6a57c4c4)
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/4b1951ec-b878-4b6e-9e70-7c0cdb79880c)
# 第二步
- fork本项目
- 修改fork项目中common/middify_password.sh 文件的密码，默认设置是123456
- 在项目中添加zerotier的网络ID(Network ID)
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/b9fb3850-9bab-4ead-a8e2-23645586cabb)
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/22bb8cf2-1591-4606-a06c-3afcf1c43404)
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/a31bed6f-431e-4dd2-a1fc-562138cccfcd)
# 第三步
- 运行actions程序
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/a30fa114-c2ee-4e1e-81f5-7ebd78397771)
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/7ad6cce3-c3c1-4397-aa4e-6f1635c5241f)
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/03abf92c-7027-4aa5-a0e6-617f1b5d608f)
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/1785b347-1428-4dec-b7b4-bb3ffa0ee699)
- 这一步看一下密码有没有修改成功
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/298c18c6-dbfc-40ae-9b98-f362e7f14c35)
- 这一步是看一下IP地址是
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/864367ec-2c72-4149-9142-ea7827d84cf0)
到这里github上的actions配制就已经完成了，接下来就是安装本址的zerotier客户端
# 我这里是windows就用windows演试，这里可以使用openwrt软件路由来实现整个局域访问了，这个相对方便
# 第一步
- 下载页面：https://www.zerotier.com/download/
- 找到windows安装程序进行安装
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/cd6e2c5d-8ec7-4acc-beea-d7cece269db6)
- 打开cmd命令终端，输入ipconfig查看是否成功，成功后有IP地址
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/dcba0eff-dcba-4bbb-b9fe-fa5fc941cf16)
# 第二步使用远程工具进行连接
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/e7d6c2f3-205e-4311-b106-3e48739195d5)
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/84fb8f16-a036-4fc4-8d54-dbe405150a11)
  ![image](https://github.com/findnr/action_ubuntu_server/assets/3909023/c720ae1e-ee8e-43af-83c5-e1870b945229)
到这里就已经完成了，恭喜你成功了！！！
















