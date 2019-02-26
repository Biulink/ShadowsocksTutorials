yum --enablerepo=epel -y install python-pip
pip install shadowsocks
echo '10443' > /root/.my-shadowsocks-port
openssl rand -base64 16 > /root/.my-shadowsocks-password
echo 'aes-256-cfb' > /root/.my-shadowsocks-encryption

/usr/bin/ssserver -s ::0 -p `cat /root/.my-shadowsocks-port` -k `cat /root/.my-shadowsocks-password` -m `cat /root/.my-shadowsocks-encryption` --user nobody --workers 2 -d start
printf "\n/usr/bin/ssserver -s ::0 -p \`cat /root/.my-shadowsocks-port\` -k \`cat /root/.my-shadowsocks-password\` -m \`cat /root/.my-shadowsocks-encryption\` --user nobody --workers 2 -d start\n\n" >> /etc/rc.d/rc.local

MY_IP=$(curl http://myip.dnsomatic.com)
printf "*****************************************\nShadowsocks服务器已经安装成功，账号如下：\n服务器：$MY_IP \n端口：`cat /root/.my-shadowsocks-port` \n密码：`cat /root/.my-shadowsocks-password` \n加密方式：`cat /root/.my-shadowsocks-encryption` \n*****************************************\n"
