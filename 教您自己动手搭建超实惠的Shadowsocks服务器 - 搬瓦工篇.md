# 教您自己动手搭建超实惠的Shadowsocks服务器 - 搬瓦工篇

本图文教程详细介绍了如何搭建Shadowsocks服务器。自己搭建Shadowsocks服务器有如下优势：

优势1: 独享一台Shadowsocks服务器，不与其他用户共享资源。

优势2: 配备CN2专线，默认自带BBR加速算法，Youtube 1080p无压力。

优势3: 支持一键换IP地址，不用担心被封。

优势4: 比直接买SS账号B格略高 🙂

费用: 最低每月16元，本站还提供9.4折优惠码:BWH1ZBPVK

## 一、注册搬瓦工账号

1.点击[搬瓦工首页地址](https://bwh1.net/aff.php?aff=23103)，点击右上角注册按钮。
![图片](/bandwagon/WechatIMG20.jpeg)

2.填写注册信息（建议不要填写真实信息，毕竟翻墙有一些匿名性比较好），完成注册。
![图片](/bandwagon/WechatIMG21.jpeg)

3.登录进入搬瓦工
![图片](/bandwagon/WechatIMG22.jpeg)

## 二、购买服务器

1.点击Services->Order New Service
![图片](/bandwagon/WechatIMG23.jpeg)

2.选择合适的套餐

推荐选择第一个或者第二个套餐，这两个套餐对比如下。

|套餐名称|地理位置|是否是CN2线路|硬盘大小|内存大小|每月流量|价格|
-------| -------|------|------|------|------|------|
SPECIAL 10G KVM PROMO V3 – LOS ANGELES – CN2|LOS ANGELES|是|10GB|512MB|500GB|29.99美元/年|
SPECIAL 20G KVM PROMO V3 – LOS ANGELES – CN2|LOS ANGELES|是|20GB|1024MB|1024GB|49.99美元/年，29.99美元/半年|

注：CN2代表到中国大陆有专线连接，网速会比较有保障。

3.点击对应套餐后面Order Now按钮
![图片](/bandwagon/WechatIMG24.jpeg)

4.直接点击Add To Cart按钮。
![图片](/bandwagon/WechatIMG25.jpeg)

5.输入优惠码：BWH1ZBPVK，点击Validate Code，然后点击Checkout，进入结账页面。
![图片](/bandwagon/WechatIMG26.jpeg)

6.确认好信息后，选择支付宝付款，勾选同意协议的选项，点击Complete Order，提交订单。
![图片](/bandwagon/WechatIMG28.jpeg)

7.点击Pay Now，进行支付。
![图片](/bandwagon/WechatIMG29.jpeg)

8.使用支付宝完成付款。完成付款后，稍等几分钟，然后回到搬瓦工主页，点击Services->My Services，查看已经购买的服务器。
![图片](/bandwagon/WechatIMG30.jpeg)

## 三、安装Shadowsocks服务端软件

1.在My Services页面点击KiwiVM Control Panel按钮，进入服务器控制面板。
![图片](/bandwagon/WechatIMG32.jpeg)

2.进入控制面板首页，记录下服务器IP地址，最后连接会使用该服务器IP。
![图片](/bandwagon/WechatIMG33.jpeg)

3.点击Shadowsocks Service选项
![图片](/bandwagon/WechatIMG34.jpeg)

4.点击Install Shadowsocks Server，等待几分钟，完成安装。
![图片](/bandwagon/WechatIMG35.jpeg)

5.待安装完成后，在会显示Shadowsocks账号信息：加密方式、端口和密码，加上前面获取的服务器IP地址，就可以在客户端登录了。
![图片](/bandwagon/WechatIMG36.jpeg)

6.参考本网站客户端连接教程，连接成功后，去Youtube测试网速。1080p毫无压力。
![图片](/bandwagon/WechatIMG37.jpeg)


## Q&A
### 没有看到Shadowsocks Server选项怎么办？
答：一般情况是由于套餐选择或者数据中心选择跟教程不一样导致的。解决方案也非常简单，点击控制面板里面的Root shell - advanced，然后把下面这段脚本复制粘贴进去，把其中xxxxxxxx改成自己的密码，然后点击Execute执行即可。
执行成功后会显示Shadowsocks安装成功的提示和账号信息，就可以直接使用了。
```
yum --enablerepo=epel -y install python-pip
pip install shadowsocks
echo '443' > /root/.my-shadowsocks-port
echo 'xxxxxxxx' > /root/.my-shadowsocks-password
echo 'aes-256-cfb' > /root/.my-shadowsocks-encryption

/usr/bin/ssserver -s ::0 -p `cat /root/.my-shadowsocks-port` -k `cat /root/.my-shadowsocks-password` -m `cat /root/.my-shadowsocks-encryption` --user nobody --workers 2 -d start
printf "\n/usr/bin/ssserver -s ::0 -p \`cat /root/.my-shadowsocks-port\` -k \`cat /root/.my-shadowsocks-password\` -m \`cat /root/.my-shadowsocks-encryption\` --user nobody --workers 2 -d start\n\n" >> /etc/rc.d/rc.local

MY_IP=$(curl http://myip.dnsomatic.com)
printf "Shadowsocks服务器已经安装成功，账号如下："
printf "服务器：$MY_IP"
printf "端口：`cat /root/.my-shadowsocks-port`"
printf "密码：`cat /root/.my-shadowsocks-password`"
printf "加密方式：`cat /root/.my-shadowsocks-encryption`"

```
### 执行完上述代码，仍然没有Shadowsocks Server选项怎么办？
答：不需要Shadowsocks Server选项了，直接下载Shadowsocks，并使用上面显示的账号信息就可以连接了。
