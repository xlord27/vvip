#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);

colornow=$(cat /etc/ssnvpn/theme/color.conf)
NC="\e[0m"
COLOR1="\033[1;36m"
COLBG1="\e[1;97;101m"             
APIGIT=$(cat /etc/ssnvpn/github/api)
EMAILGIT=$(cat /etc/ssnvpn/github/email)
USERGIT=$(cat /etc/ssnvpn/github/username)


function setapi(){
    clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}           • IPVPS GITHUB API •        ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

if [[ -f /etc/ssnvpn/github/api && -f /etc/ssnvpn/github/email && /etc/ssnvpn/github/username ]]; then   rec="OK"
else
    mkdir /etc/ssnvpn/github > /dev/null 2>&1
fi

read -p " E-mail   : " EMAIL1
if [ -z $EMAIL1 ]; then
echo -e "   [INFO] Please Input Your Github Email Adress"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi

read -p " Username : " USERNAME1
if [ -z $USERNAME1 ]; then
echo -e "   [INFO] Please Input Your Github Username"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi

read -p " API      : " API1
if [ -z $API1 ]; then
echo -e "  [INFO] Please Input Your Github API"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-ip
fi

sleep 2
echo "$EMAIL1" > /etc/ssnvpn/github/email
echo "$USERNAME1" > /etc/ssnvpn/github/username
echo "$API1" > /etc/ssnvpn/github/api
echo "ON" > /etc/ssnvpn/github/gitstat
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}            • REGISTER IPVPS •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "   [INFO] Github Api Setup Successfully"
echo -e ""
echo -e "   • Email : $EMAIL1"
echo -e "   • User  : $USERNAME1"
echo -e "   • API   : $API1"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
}

function viewapi(){
    clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}           • LIST REGISTER IP •        ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "  • Email : $EMAILGIT"
echo -e "  • User  : $USERGIT"
echo -e "  • API   : $APIGIT"
echo -e "  • All U need Is Create a new repository "
echo -e "    & Nammed : permission "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
}

function add_ip(){
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}             • REGISTER IPVPS •        ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
rm -rf /root/izinvps
read -p "│  NEW IPVPS : " daftar
echo -e ""
echo -e "  [INFO] Checking the IPVPS!"
sleep 1
REQIP=$(curl -sS https://raw.githubusercontent.com/${USERGIT}/izinvps/main/ip | awk '{print $4}' | grep $daftar)
if [[ $daftar = $REQIP ]]; then
echo -e "  [INFO] VPS IP Already Registered!!"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
else
echo -e "  [INFO] OK! IP VPS is not Registered!"
echo -e "  [INFO] Lets Regester it!"
sleep 3
clear
fi
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}             • REGISTER IPVPS •        ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "│  User Name  : " client
if [ -z $client ]; then
cd
echo -e "  [INFO] Please Input client"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi


read -p "│  EXP Date   : " exp
if [ -z $exp ]; then
cd
echo -e "   [INFO] Please Input exp date"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi

x="ok"

satu="ON"
dua="OFF"
while true $x != "ok"
do
echo -e ""
echo -e "  ${COLOR1}[01]${NC} • ADMIN   ${COLOR1}[02]${NC} • NORMAL"
echo -e ""
echo -ne "│  Input your choice : "; read list
echo ""
case "$list" in
   1) isadmin="$satu";break;;
   2) isadmin="$dua";break;;
esac
done


exp=$(date -d "$exp days" +"%Y-%m-%d")
hariini=$(date -d "0 days" +"%Y-%m-%d")
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/izinvps.git &> /dev/null
cd /root/izinvps/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
touch ip &> /dev/null
touch newuser &> /dev/null
TEXT="
Name        : $client
Admin Panel : $isadmin
Exp         : $exp
IPVPS       : $daftar
Reg Date    : $hariini
"
echo "${TEXT}" >>/root/izinvps/newuser
echo "### $client $exp $daftar $isadmin" >>/root/izinvps/ip
git add .
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/izinvps.git &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/izinvps.git &> /dev/null
sleep 1
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}            • REGISTER IPVPS •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "  Client IP Regested Successfully"
echo -e ""
echo -e "  Client Name   : $client"
echo -e "  Admin Panel   : $isadmin"
echo -e "  IP VPS        : $daftar"
echo -e "  Register Date : $TheKill"
echo -e "  Expired Date  : $exp"
cd
rm -rf /root/izinvps
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
}
function delipvps(){
clear
rm -rf /root/izinvps &> /dev/null
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/izinvps.git &> /dev/null
cd /root/izinvps/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
touch ip &> /dev/null
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}             • DELETE IPVPS •          ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
grep -E "^### " "/root/izinvps/ip" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "   Please Input Number : " nombor
if [ -z $nombor ]; then
cd
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}             • DELETE IPVPS •          ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "   [INFO] Please Input Correct Number"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi

name1=$(grep -E "^### " "/root/izinvps/ip" | cut -d ' ' -f 2 | sed -n "$nombor"p) #name
exp=$(grep -E "^### " "/root/izinvps/ip" | cut -d ' ' -f 3 | sed -n "$nombor"p) #exp
ivps1=$(grep -E "^### " "/root/izinvps/ip" | cut -d ' ' -f 4 | sed -n "$nombor"p) #ip
sed -i "s/### $name1 $exp $ivps1//g" /root/izinvps/ip &> /dev/null
hariini2=$(date -d "0 days" +"%Y-%m-%d")
TEXTD="
Name     : $name1
IPVPS    : $ivps1
Status   : Deleted on  $hariini2
"
echo "${TEXTD}" >>/root/izinvps/delete_log  &> /dev/null

git add . &> /dev/null
git commit -m remove &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/izinvps.git &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/izinvps.git &> /dev/null
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}              • REGISTER IPVPS •       ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "  Client IP Deleted Successfully"
echo -e ""
echo -e "  Ip VPS       : $ivps1"
echo -e "  Expired Date : $exp"
echo -e "  Client Name  : $name1"
cd
rm -rf /root/izinvps
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
}

function renewipvps(){
 clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}          • REGISTER IPVPS •           ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
rm -rf /root/izinvps
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/izinvps.git
cd /root/izinvps/
rm -rf .git
git init
touch ip
echo -e "   [ ${Lyellow}INFO${NC} ] Checking list.."

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/root/izinvps/ip")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
  clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}            • REGISTER IPVPS •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "   [INFO] You have no existing clients!"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}            • REGISTER IPVPS •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
grep -E "^### " "/root/izinvps/ip" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
  if [[ ${CLIENT_NUMBER} == '1' ]]; then
    read -rp " Select one client [1]: " CLIENT_NUMBER
  else
    read -rp " Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
  fi
if [ -z $CLIENT_NUMBER ]; then
cd
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}            • REGISTER IPVPS •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "   [INFO] Please Input Correct Number"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi
done
echo -e ""
read -p " Expired (days): " masaaktif
if [ -z $masaaktif ]; then
cd
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}               • REGISTER IPVPS        ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "  [INFO] Please Input Correct Number"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi
name1=$(grep -E "^### " "/root/izinvps/ip" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p) #name
exp=$(grep -E "^### " "/root/izinvps/ip" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p) #exp
ivps1=$(grep -E "^### " "/root/izinvps/ip" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p) #ip

now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
exp3=$(($exp2 + $masaaktif))
exp4=$(date -d "$exp3 days" +"%Y-%m-%d")
sed -i "s/### $name1 $exp $ivps1/### $name1 $exp4 $ivps1/g" /root/izinvps/ip
git add .
git commit -m renew
git branch -M main
git remote add origin https://github.com/${USERGIT}/izinvps.git
git push -f https://${APIGIT}@github.com/${USERGIT}/izinvps.git
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}          • REGISTER IPVPS •           ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "  Client IP VPS Renew Successfully"
echo -e ""
echo -e "  Ip VPS        : $ivps1"
echo -e "  Renew Date    : $now"
echo -e "  Days Added    : $masaaktif Days"
echo -e "  Expired Date  : $exp4"
echo -e "  Client Name   : $name1"
cd
rm -rf /root/izinvps
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
}

function useripvps(){
clear
rm -rf /root/izinvps
git config --global user.email "${EMAILGIT}"
git config --global user.name "${USERGIT}"
git clone https://github.com/${USERGIT}/izinvps.git
cd /root/izinvps/
rm -rf .git
git init
touch ip
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}             • REGISTER IPVPS •        ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
grep -E "^### " "/root/izinvps/ip" | cut -d ' ' -f 2 | nl -s '. '
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
cd
rm -rf /root/izinvps
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
}
function resetipvps(){
clear
rm -f /etc/ssnvpn/github/email
rm -f /etc/ssnvpn/github/username
rm -f /etc/ssnvpn/github/api
rm -f /etc/ssnvpn/github/gitstat
echo "OFF" > /etc/ssnvpn/github/gitstat
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}            • RESET GITUB API •        ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "  [INFO] Github API Reseted Successfully"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
}
Isadmin=$(curl -sS https://raw.githubusercontent.com/MyRidwan/izinvps/main/ip | grep $MYIP | awk '{print $5}')
if [ "$Isadmin" = "OFF" ]; then
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}         • PREMIUM USER ONLY •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " [INFO] Only PRO Users Can Use This Panel"
echo -e " [INFO] Buy Premium Membership : "
echo -e " [INFO] PM : "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}            • REGISTER IPVPS •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
GITREQ=/etc/ssnvpn/github/gitstat
if [ -f "$GITREQ" ]; then
    cekk="ok"
else
    mkdir /etc/ssnvpn/github
    touch /etc/ssnvpn/github/gitstat
    echo "OFF" > /etc/ssnvpn/github/gitstat
fi

stst1=$(cat /etc/ssnvpn/github/gitstat)
if [ "$stst1" = "OFF" ]; then
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}             • REGISTER IPVPS •        ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "   • You Need To Set Github API First!"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "   Press any key to Set API"
setapi
fi
stst=$(cat /etc/ssnvpn/github/gitstat)
if [ "$stst" = "ON" ]; then
APIOK="CEK API"
rex="viewapi"
else
APIOK="SET API"
rex="setapi"
fi
if [ "$stst" = "ON" ]; then
ISON="RESET API"
ressee="resetipvps"
else
ISON=""
ressee="menu-ip"
fi
echo -e " $COLOR1 [01]$NC • $APIOK      $COLOR1 [04]$NC • RENEW IPVPS"
echo -e " $COLOR1 [02]$NC • ADD IPVPS    $COLOR1 [05]$NC • LIST IPVPS"
echo -e " $COLOR1 [03]$NC • DELETE IPVPS $COLOR1 [06]$NC • $ISON"
echo -e "   "
echo -e " $COLOR1 [00]$NC • GO BACK"

echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; $rex ;;
02 | 2) clear ; add_ip ;;
03 | 3) clear ; delipvps ;;
04 | 4) clear ; renewipvps ;;
05 | 5) clear ; useripvps ;;
06 | 6) clear ; $ressee ;;
00 | 0) clear ; menu ;;
*) clear ; menu-ip ;;
esac
