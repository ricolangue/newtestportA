#!/bin/bash 

web1="https://office.orchestra.tools/"
web2="https://webmail.proweaver.email/"
web3="https://office.proweaver.tools/securitydatabank/accounts"
web4="https://office.proweaver.tools/emailernew/login"
web5="https://proxy.proweaver.tools/"
web6="https://office.proweaver.tools/hrsystem/"
web7="https://office.proweaver.tools/prtool/login"
kcode="https://docs.google.com/spreadsheets/d/1aUm9Eh8OxYKvzNPHGsI1qlD47pqHRESnhALY4r2zMtk/edit?gid=0#gid=0"
s3_amazon="https://ap-southeast-1.console.aws.amazon.com/s3/buckets/proweaver-files?region=ap-southeast-1&bucketType=general&prefix=TECH/&showversions=false"
minifier="https://www.minifier.org/"


echo "start $web1" > web1.sh
echo "start $web2" > web2.sh
echo "start $web3" > web3.sh
echo "start $web4" > web4.sh
echo "start $web5" > web5.sh
echo "start $web6" > web6.sh
echo "start $web7" > web7.sh
echo "start $kcode" > kcode.sh
echo "start $s3_amazon" > s3_amazon.sh
echo "start $minifier" > minifier.sh

start ./web1.sh
start ./web2.sh
start ./web3.sh
start ./web4.sh
start ./web5.sh
start ./web6.sh
start ./web7.sh
start ./kcode.sh
start ./s3_amazon.sh
start ./minifier.sh



