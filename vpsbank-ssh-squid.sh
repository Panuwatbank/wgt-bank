#!/bin/bash
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "VPS Manager 2.0.1" ; tput sgr0
tput setaf 3 ; tput bold ; echo "" ; echo "Este script irá:" ; echo ""
echo "● การติดตั้งและกำหนดค่าพร็อกซีปลาหมึกบนพอร์ต 80, 3128, 8080 และ 8000" ; echo "  para เพื่อให้การเชื่อมต่อ SSH กับเซิร์ฟเวอร์นี้"
echo "● กำหนดค่า OpenSSH เพื่อให้ทำงานบนพอร์ต 22 และ 143 "
echo "● กำหนดค่า dropbear ในพอรฺ์ต 109
echo "● ติดตั้งชุดสคริปต์เป็นคำสั่งระบบสำหรับการจัดการผู้ใช้" ; tput sgr0
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "กด"Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
tput setaf 2 ; tput bold ; echo "	Termos de Uso" ; tput sgr0
echo ""
echo "เมื่อใช้ 'VPS Manager 2.0' คุณ 
คุณยอมรับข้อกำหนดการใช้งานต่อไปนี้:"
echo ""
echo "1. คุณสามารถ:"
echo "a. ติดตั้งและใช้ 'VPS Manager 2.0' บนเซิร์ฟเวอร์ของคุณ (s)(es)."
echo "b. สร้างจัดการและลบผู้ใช้จำนวนไม่ จำกัด จำนวนผ่านชุดสคริปต์นี้ ผู้ใช้ไม่ จำกัด ผ่านชุดสคริปต์นี้."
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte กุญแจสำคัญใด ๆ เพื่อดำเนินการต่อ..." ; echo "" ; echo "" ; สคริปต์0
echo "2. คุณไม่สามารถ:"
echo "a. แก้ไขแก้ไขแชร์หรือแจกจ่ายต่อ (ฟรีหรือเชิงพาณิชย์)"
echo "ชุดสคริปต์นี้โดยไม่ได้รับอนุญาตจากผู้พัฒนาซอฟต์แวร์."
echo "b. ชุดสคริปต์นี้โดยไม่ได้รับอนุญาตจากผู้พัฒนาซอฟต์แวร์ scripts."
echo ""
echo "3.คุณไม่สามารถ:"
echo "a. จำนวนเงินที่จ่ายสำหรับชุดสคริปต์นี้ไม่รวมการรับประกันหรือการสนับสนุนเพิ่มเติม,"
echo "จำนวนเงินที่สำลักการะการ,"
echo "ได้รับความช่วยเหลือและแก้ไขปัญหาตราบใดที่คุณเคารพเงื่อนไขการใช้งาน."
echo "b. O ผู้ใช้สคริปต์ชุดนี้เป็นผู้รับผิดชอบ แต่เพียงผู้เดียวสำหรับประเภทใด ๆ"
echo "ลักษณะทางจริยธรรมหรือกฎหมายที่เกิดจากการใช้สคริปต์ชุดนี้เพื่อจุดประสงค์ใด ๆ."
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "กดปุ่มใดก็ได้เพื่อดำเนินการต่อ..." ; echo "" ; echo "" ; tput sgr0
echo "4. คุณยอมรับว่านักพัฒนาซอฟต์แวร์จะไม่รับผิดชอบต่อ: ":"
echo "a. ปัญหาที่เกิดจากการใช้สคริปต์แจกจ่ายที่ไม่ได้รับอนุญาต."
echo "b. ปัญหาที่เกิดจากความขัดแย้งระหว่างสคริปต์ชุดนี้กับสคริปต์จากนักพัฒนาซอฟต์แวร์คนอื่น ๆ."
echo "c. ปัญหาที่เกิดจากการแก้ไขหรือปรับเปลี่ยนโค้ดสคริปต์ที่ไม่ได้รับอนุญาต."
echo "d. ปัญหาของระบบที่เกิดจากโปรแกรมของ บริษัท อื่นหรือการแก้ไข / ทดลองใช้ของผู้ใช้."
echo "e. ปัญหาที่เกิดจากการปรับเปลี่ยนระบบเซิร์ฟเวอร์."
echo "f. ปัญหาที่เกิดจากผู้ใช้ไม่ทำตามคำแนะนำในเอกสารชุดสคริปต์."
echo "g. ปัญหาที่เกิดขึ้นขณะใช้สคริปต์เพื่อประโยชน์ทางการค้า "."
echo "h. ปัญหาที่เกิดขึ้นขณะใช้สคริปต์เพื่อประโยชน์ทางการค้า "."
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
IP=$(wget -qO- ipv4.icanhazip.com)
read -p "Para continuar confirme o IP deste servidor: " -e -i $IP ipdovps
if [ -z "$ipdovps" ]
then
	tput setaf 7 ; tput setab 1 ; tput bold ; echo "" ; echo "" ; echo " Você não digitou o IP deste servidor. Tente novamente. " ; echo "" ; echo "" ; tput sgr0
	exit 1
fi
if [ -f "/root/usuarios.db" ]
then
tput setaf 6 ; tput bold ;	echo ""
	echo "Uma base de dados de usuários ('usuarios.db') foi encontrada!"
	echo "Deseja mantê-la (preservando o limite de conexões simultâneas dos usuários)"
	echo "ou criar uma nova base de dados?"
	tput setaf 6 ; tput bold ;	echo ""
	echo "[1] Manter Base de Dados Atual"
	echo "[2] Criar uma Nova Base de Dados"
	echo "" ; tput sgr0
	read -p "Opção?: " -e -i 1 optiondb
else
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
echo ""
read -p "Deseja ativar a compressão SSH dropbear (pode aumentar o consumo de RAM)? [s/n]) " -e -i n sshcompression
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Aguarde a configuração automática" ; echo "" ; tput sgr0
sleep 3
apt-get update -y
apt-get upgrade -y
cd
# install dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=109
DROPBEAR_PORT=110"/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS=" -p 110 -p 109"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
service ssh restart
service dropbear restart


rm /bin/criarusuario /bin/expcleaner /bin/sshlimiter /bin/addhost /bin/listar /bin/sshmonitor /bin/ajuda > /dev/null
rm /root/ExpCleaner.sh /root/CriarUsuario.sh /root/sshlimiter.sh > /dev/null
apt-get install squid3 bc screen nano unzip dos2unix wget -y
killall apache2
apt-get purge apache2 -y
if [ -f "/usr/sbin/ufw" ] ; then
	ufw allow 143/tcp ; ufw allow 80/tcp ; ufw allow 3128/tcp ; ufw allow 8000/tcp ; ufw allow 8080/tcp
fi
if [ -d "/etc/squid3/" ]
then
	wget https://raw.githubusercontent.com/3955/user-bank/master/squid1.txt -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget https://raw.githubusercontent.com/3955/user-bank/master/squid2.txt -O /tmp/sqd3
	cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid3/squid.conf
	wget https://raw.githubusercontent.com/3955/user-bank/master/payload.txt -O /etc/squid3/payload.txt
	echo " " >> /etc/squid3/payload.txt
	grep -v "^Port 143" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 143" >> /etc/ssh/sshd_config
	grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config > /tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
	echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
	wget https://raw.githubusercontent.com/3955/user-bank/master/addhost.sh -O /bin/addhost
	chmod +x /bin/addhost
	wget https://raw.githubusercontent.com/3955/user-bank/master/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	wget https://raw.githubusercontent.com/3955/user-bank/master/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	wget https://raw.githubusercontent.com/3955/user-bank/master/delhost.sh -O /bin/delhost
	chmod +x /bin/delhost
	wget https://raw.githubusercontent.com/3955/user-bank/master/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	wget https://raw.githubusercontent.com/3955/user-bank/master/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	wget https://raw.githubusercontent.com/3955/user-bank/master/remover.sh -O /bin/remover
	chmod +x /bin/remover
	wget https://raw.githubusercontent.com/3955/user-bank/master/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	wget https://raw.githubusercontent.com/3955/user-bank/master/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	wget https://raw.githubusercontent.com/3955/user-bank/master/ajuda.sh -O /bin/ajuda
	chmod +x /bin/ajuda
	wget https://raw.githubusercontent.com/3955/user-bank/master/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	if [ ! -f "/etc/init.d/squid3" ]
	then
		service squid3 reload > /dev/null
	else
		/etc/init.d/squid3 reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi
fi
if [ -d "/etc/squid/" ]
then
	wget https://raw.githubusercontent.com/3955/user-bank/master/squid1.txt -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget https://raw.githubusercontent.com/3955/user-bank/master/squid.txt -O /tmp/sqd3
	cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid/squid.conf
	wget https://raw.githubusercontent.com/3955/user-bank/master/payload.txt -O /etc/squid/payload.txt
	echo " " >> /etc/squid/payload.txt
	grep -v "^Port 143" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 143" >> /etc/ssh/sshd_config
	grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config > /tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
	echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
	wget https://raw.githubusercontent.com/3955/user-bank/master/addhost.sh -O /bin/addhost
	chmod +x /bin/addhost
	wget https://raw.githubusercontent.com/3955/user-bank/master/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	wget https://raw.githubusercontent.com/3955/user-bank/master/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	wget https://raw.githubusercontent.com/3955/user-bank/master/delhost.sh -O /bin/delhost
	chmod +x /bin/delhost
	wget https://raw.githubusercontent.com/3955/user-bank/master/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	wget https://raw.githubusercontent.com/3955/user-bank/master/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	wget https://raw.githubusercontent.com/3955/user-bank/master/remover.sh -O /bin/remover
	chmod +x /bin/remover
	wget https://raw.githubusercontent.com/3955/user-bank/master/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	wget https://raw.githubusercontent.com/3955/user-bank/master/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	wget https://raw.githubusercontent.com/3955/user-bank/master/ajuda.sh -O /bin/ajuda
	chmod +x /bin/ajuda
	wget https://raw.githubusercontent.com/3955/user-bank/master/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	if [ ! -f "/etc/init.d/squid" ]
	then
		service squid reload > /dev/null
	else
		/etc/init.d/squid reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi
fi
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Proxy Squid ติดตั้ง ให้ ใช้งาน ใน พอร์ต: 80, 3128, 8080 e 8000" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "SSH dropbear ทำงานบนพอร์ต 22 และ 143,109" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "สคริปต์สำหรับการจัดการผู้ใช้ที่ติดตั้ง" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "อ่านเอกสารเพื่อหลีกเลี่ยงข้อสงสัยและปัญหา!!" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "เมื่อต้องการดูคำสั่งที่พร้อมใช้งานให้ใช้คำสั่ง: help: ajuda" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "เสร็จแล้ว ไอ้เหี้ย ไอ้สัส เลว"
echo ""
if [[ "$optiondb" = '2' ]]; then
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
if [[ "$sshcompression" = 's' ]]; then
	grep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
	echo "Compression yes" >> /etc/ssh/sshd_config
fi
if [[ "$sshcompression" = 'n' ]]; then
	grep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
fi
exit 1
