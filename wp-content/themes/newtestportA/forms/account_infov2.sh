#!/bin/bash 
#chmod u+x run_all.sh 

#date '+%B %d'
#date '+%B'
folderA="Web-Accounts"
if [ ! -d $folderA ]; then
	mkdir -p $folderA;
	
else
	echo "Directory already exist"

fi;			
			
if [ ! -d $folderA/$tempFolder ]; then
	mkdir -p $folderA/$tempFolder;
	
else
	echo "Directory already exist"

fi;

date '+%B' > month.txt

if [ -e "./month.txt" ]
then
	_month="$(<./month.txt)"
	folderB=$(echo $_month | tr 'a-z' 'A-Z')
else
	_month=""
	folderB=$(echo $_month | tr 'a-z' 'A-Z')
fi

if [ ! -d ./$folderA/$tempFolder/$folderB ]; then
	mkdir -p ./$folderA/$tempFolder/$folderB;
	
else
	echo "Directory already exist"

fi;
	
myfolderA=$(date '+%m-%d-%Y')
if [ ! -d ./$folderA/$tempFolder/$folderB/$myfolderA ]; then
	mkdir -p ./$folderA/$tempFolder/$folderB/$myfolderA;
	
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

if [ ! -d "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web" ]; then

	mkdir -p "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web";
	mkdir -p "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/bu";
	mkdir -p "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot";
	mkdir -p "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/up";

fi 

task_link="https://office.orchestra.tools/tasks/viewtask/"$task_ID
client_webA="https://www."$client_web
echo "$client_webA" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/website_link.txt 
echo "start $client_webA" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/client_webA.sh
start ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/client_webA.sh
echo "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/" > client_file_path.txt 
echo "$task_ID" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/task_ID.txt 

#screenshot Directory 
cscript //nologo ./mydirectory.vbs
mydirectory="$(<./mydirectory.txt)"
#mydirectory='D:\RICLANGUE-FILES\'
scrn_directory=$mydirectory'\'$folderA'\'$tempFolder'\'$folderB'\'$myfolderA'\'$client_web'\screenshot'
#client_dir=D://RICLANGUE-FILES/$folderA/$tempFolder/$folderB/$myfolderA/$client_web
client_dir=$mydirectory'\'$folderA'\'$tempFolder'\'$folderB'\'$myfolderA'\'$client_web

echo $scrn_directory > screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo $scrn_directory >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '    PDQA/RWC/FORMS SCREENSHOTS    ' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\bu home" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\email" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\viewform" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\ofdp" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\up home" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '    BLOG SCREENSHOTS    ' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\BU_Homepage" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_page_two_posts" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_page_two_posts_admin" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_Page" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_Page_Admin" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_Post_Comment" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_Post_Comment_Admin" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Author_Page" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Category_Page" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Tag_Page" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Blog_Mobile" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Post_Mobile" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Search" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\UP_Homepage" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '    TESTIMONIAL SCREENSHOTS    ' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\BU_Homepage" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_page_two_posts" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_page_two_posts_admin" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_Page" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_Page_Admin" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_Post_Comment" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_Post_Comment_Admin" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Author_Page" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Category_Page" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Tag_Page" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Testimonial_Mobile" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Post_Mobile" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\Search" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\UP_Homepage" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '    NEWS CATEGORY SCREENSHOTS    ' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo '--------------------------------------------------' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\BU_Homepage" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_page_two_posts" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_page_two_posts_admin" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_Page" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_Page_Admin" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_Post_Comment" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_Post_Comment_Admin" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\News_Mobile" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt
echo ':screenshot "'$scrn_directory'\UP_Homepage" --fullpage' >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_path.txt

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

echo "Client Name: $client_name" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "task_link=$task_link" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "website=$client_webA" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== START DATABASE =====" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "db_link=$db_link" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "db_name=$db_name" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "db_username=$db_username" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "db_password=$db_password" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== END DATABASE =====" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "                     " >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== START FTP =====" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "ftp_hostname=$ftp_hostname" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "ftp_username=$ftp_username" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "ftp_password=$ftp_password" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== END FTP =====" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
#run command 
echo "start $client_webB" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/client_webB.sh
echo "start $db_link" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/db_link.sh

#start browser 
start ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/client_webB.sh
start ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/db_link.sh

#s3://proweaver-files/TECH/Ideal Home Health Services Inc./version2/October-1-2024-RicoLa/screenshot/

echo "                     " >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== SCREENSHOT FILE PATH =====" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "scrn_path=$scrn_path_final" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
