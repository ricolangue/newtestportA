#!/bin/bash 
#chmod u+x run_all.sh 

#date '+%B %d'
#date '+%B'
echo "choice $opt"

date '+%B' > month.txt

if [ -e "./month.txt" ]
then
    _month="$(<./month.txt)"
	folderB=$(echo $_month | tr 'a-z' 'A-Z')
else
    _month=""
	folderB=$(echo $_month | tr 'a-z' 'A-Z')
fi

#echo $folderB

if [ ! -d $folderB ]; then
    mkdir -p $folderB;
	
else
	echo "Directory already exist"

fi;

myfolderA=$(date '+%m-%d-%Y')
if [ ! -d ./$folderB/$myfolderA ]; then
	mkdir -p ./$folderB/$myfolderA;
	
else
	echo "Directory already exist"
fi;

read -p "Enter account name:" client_name  
#echo "The client name: " $client_name

while [[ "${client_name}" == "" ]] ; do
   read -p "Enter account name:" client_name  
   #echo "The client name: " $client_name
  #(( i += 1 ))
done

read -p "Enter task ID:" task_ID  
#echo "The client name: " $client_name

while [[ "${task_ID}" == "" ]] ; do
   read -p "Enter task ID:" task_ID   
done

read -p "Enter client website:" client_web  
#echo "The website link is: " $client_web

while [[ "${client_web}" == "" ]] ; do
   read -p "Enter client website:" client_web  
   #echo "The website link is: " $client_web
  #(( i += 1 ))
done

if [ ! -d "./$folderB/$myfolderA/$client_web" ]; then

	mkdir -p "./$folderB/$myfolderA/$client_web";
	mkdir -p "./$folderB/$myfolderA/$client_web/bu";
	mkdir -p "./$folderB/$myfolderA/$client_web/screenshot";
	mkdir -p "./$folderB/$myfolderA/$client_web/up";

fi 

task_link="https://office.orchestra.tools/tasks/viewtask/"$task_ID
client_webA="https://www."$client_web
echo "$client_webA" > ./$folderB/$myfolderA/$client_web/website_link.txt 
echo "start $client_webA" > ./$folderB/$myfolderA/$client_web/client_webA.sh
start ./$folderB/$myfolderA/$client_web/client_webA.sh
echo "./$folderB/$myfolderA/$client_web/" > client_file_path.txt 
echo "$task_ID" > ./$folderB/$myfolderA/$client_web/task_ID.txt 

#screenshot Directory 
cscript //nologo ./mydirectory.vbs
mydirectory="$(<./mydirectory.txt)"
#mydirectory='D:\RICLANGUE-FILES\'
scrn_directory=$mydirectory'\'$folderA'\'$tempFolder'\'$folderB'\'$myfolderA'\'$client_web'\screenshot'
#client_dir=D://RICLANGUE-FILES/$folderA/$tempFolder/$folderB/$myfolderA/$client_web
client_dir=$mydirectory'\'$folderA'\'$tempFolder'\'$folderB'\'$myfolderA'\'$client_web
echo $scrn_directory > screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo $scrn_directory >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '    PDQA/RWC/FORMS SCREENSHOTS    ' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\bu home" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\email" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\viewform" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\ofdp" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\up home" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '    BLOG SCREENSHOTS    ' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\BU_Homepage" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_page_two_posts" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_page_two_posts_admin" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_Page" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_Page_Admin" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_Post_Comment" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_Post_Comment_Admin" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Author_Page" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Category_Page" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Tag_Page" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_Mobile" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Post_Mobile" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Search" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\UP_Homepage" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '    TESTIMONIAL SCREENSHOTS    ' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\BU_Homepage" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_page_two_posts" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_page_two_posts_admin" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_Page" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_Page_Admin" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_Post_Comment" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_Post_Comment_Admin" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Author_Page" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Category_Page" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Tag_Page" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_Mobile" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Post_Mobile" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Search" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\UP_Homepage" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '    NEWS CATEGORY SCREENSHOTS    ' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\BU_Homepage" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_page_two_posts" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_page_two_posts_admin" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_Page" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_Page_Admin" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_Post_Comment" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_Post_Comment_Admin" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_Mobile" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\UP_Homepage" --fullpage' >> ./$folderB/$myfolderA/$client_web/screenshot_path.txt

#email verification links: 
#./verify_email.sh 

read -p "Enter database link:" db_link  
#echo "The database link: " $db_link

while [[ "${db_link}" == "" ]] ; do
   read -p "Enter database link:" db_link  
   #echo "The database link: " $db_link

  #(( i += 1 ))
done

read -p "Enter database name:" db_name  
#echo "The database link: " $db_link

while [[ "${db_name}" == "" ]] ; do
   read -p "Enter database name:" db_name 
   #echo "The database link: " $db_link

  #(( i += 1 ))
done

read -p "Enter db username:" db_username 
#echo "The db username: " $db_username

while [[ "${db_username}" == "" ]] ; do
      
   read -p "Enter db username:" db_username 
   #echo "The db username: " $db_username
   
  #(( i += 1 ))
done

read -p "Enter db password:" db_password 
#echo "The db password: " $db_password

while [[ "${db_password}" == "" ]] ; do
   
   read -p "Enter db password:" db_password 
   #echo "The db password: " $db_password

  #(( i += 1 ))
done

read -p "Enter ftp hostname:" ftp_hostname 
#echo "The ftp hostname: " $ftp_hostname

while [[ "${ftp_hostname}" == "" ]] ; do
   
   read -p "Enter ftp hostname:" ftp_hostname 
   #echo "The ftp hostname: " $ftp_hostname

  #(( i += 1 ))
done

read -p "Enter ftp username:" ftp_username 
#echo "The ftp username: " $ftp_username

while [[ "${ftp_username}" == "" ]] ; do
   
   read -p "Enter ftp username:" ftp_username 
   #echo "The ftp username: " $ftp_username

  #(( i += 1 ))
done

read -p "Enter ftp password:" ftp_password 
#echo "The ftp password: " $ftp_password

while [[ "${ftp_password}" == "" ]] ; do
   
   read -p "Enter ftp password:" ftp_password 
   #echo "The ftp password: " $ftp_password

  #(( i += 1 ))
done

client_webB="https://www."$client_web"/?s=[form"
s3_amazon_link="https://console.aws.amazon.com/s3/buckets/proweaver-files"

echo "Client Name: $client_name" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "task_link=$task_link" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "website=$client_webA" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== START DATABASE =====" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "db_link=$db_link" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "db_name=$db_name" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "db_username=$db_username" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "db_password=$db_password" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== END DATABASE =====" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "                     " >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== START FTP =====" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "ftp_hostname=$ftp_hostname" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "ftp_username=$ftp_username" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "ftp_password=$ftp_password" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== END FTP =====" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
#run command 
echo "start $client_webB" > ./$folderB/$myfolderA/$client_web/client_webB.sh
echo "start $db_link" > ./$folderB/$myfolderA/$client_web/db_link.sh

#start browser 
start ./$folderB/$myfolderA/$client_web/client_webB.sh
start ./$folderB/$myfolderA/$client_web/db_link.sh

#s3://proweaver-files/TECH/Ideal Home Health Services Inc./version2/October-1-2024-RicoLa/screenshot/

echo "                     " >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== SCREENSHOT FILE PATH =====" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
echo "scrn_path=$scrn_path_final" >> ./$folderB/$myfolderA/$client_web/$client_web".txt"
