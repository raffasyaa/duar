#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
cp /media/cybervpn/var.txt /tmp
cp /root/cybervpn/var.txt /tmp
rm -rf cybervpn
function install1(){
apt update && apt upgrade -y
apt install python3 python3-pip -y
apt install sqlite3 -y
}

function install2(){
pip3 install -r requirements.txt
pip3 install pillow
pip3 install speedtest-cli
pip3 install aiohttp
pip3 install paramiko
}

rm -rf cybervpn
cd /usr/bin/
wget https://raw.githubusercontent.com/raffasyaa/duar/main/coid/file.zip
unzip file.zip
chmod +x /usr/bin/*
rm -rf file.zip
install1
cd
cd /media/
wget https://raw.githubusercontent.com/raffasyaa/duar/main/coid/pack.zip
unzip pack.zip
rm -rf pack.zip
cd cybervpn
rm var.txt
rm -rf database.db
install2

echo "INSTALL BOT PANEL CREATE ACCOUNT VPN"
read -e -p "[*] YOUR ID : " admin
read -e -p "[*] BOT TOKEN : " token
read -e -p "[*] YOUR USERNAME ( tanpa @ ) : " user
read -e -p "[*] YOUR DOMAIN : " domainku

cat > /media/cybervpn/var.txt << END
ADMIN="$admin"
BOT_TOKEN="$token"
DOMAIN="$domainku"
DNS="example.a"
PUB="7fbd1f8aa0abfe15a7903e837f78aba39cf61d36f183bd604daa2fe4ef3b7b59"
OWN="$user"
SALDO="100000"
END

rm -f /usr/bin/skt

echo -e '#!/bin/bash\ncd /media/\npython3 -m cybervpn' > /usr/bin/skt

chmod 777 /usr/bin/skt
cat > /etc/systemd/system/sktvpn.service << END
[Unit]
Description=Simple SKT - @SaputraTech
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/skt
Restart=always

[Install]
WantedBy=multi-user.target

END
systemctl daemon-reload
systemctl start sktvpn
systemctl enable sktvpn

clear
cp /tmp/var.txt /media/cybervpn

echo -e "
INSTALL PANEL VPN DONE COMPLETED
PANEL VPM SERVICE ( sktvpn )
"
rm -rf /media/cybervpn.zip