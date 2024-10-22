#!/bin/bash 
#chmod u+x run_all.sh 

#date '+%B %d'
#date '+%B'
folderA="Web-Accounts"
if [ ! -d $folderA ]; then
	mkdir -p $folderA;
	echo "$folderA was created successfully"
	
else
	echo "Directory already exist"

fi;			

#tempFolder="$opt" | sed -E 's/ /-/'
#echo "$tempFolder" > ./$tempFolder.txt
tempFolder="FORM-CONVERSION"
			
if [ ! -d $folderA/$tempFolder ]; then
	mkdir -p $folderA/$tempFolder;
	echo "$tempFolder was created successfully"
	
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
	echo "$folderB was created successfully"
	
else
	echo "Directory already exist"

fi;
	
myfolderA=$(date '+%m-%d-%Y')
if [ ! -d ./$folderA/$tempFolder/$folderB/$myfolderA ]; then
	mkdir -p ./$folderA/$tempFolder/$folderB/$myfolderA;
	echo "$myfolderA was created successfully"
	
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
#echo "start $client_webA" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/client_webA.sh
start ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/client_webA.sh
echo "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/" > client_file_path.txt 
echo "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/client_file_path.txt 
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
echo $client_dir > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/client_dir.txt
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
echo ":screenshot '"$scrn_directory"\bu home' --fullpage" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_buhome_path.txt
echo ":screenshot '"$scrn_directory"\email' --fullpage" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_email_path.txt
echo ":screenshot '"$scrn_directory"\viewform' --fullpage" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_viewform_path.txt
echo ":screenshot '"$scrn_directory"\ofdp' --fullpage" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_ofdp_path.txt
echo ":screenshot '"$scrn_directory"\up home' --fullpage" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_uphome_path.txt

if [ -e "./screenshot.vbs" ]
then
	#scrn_txt="$(<./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/scrn.txt)"
	#cp ./template/pdqa_form.txt ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
	cp ./screenshot.vbs ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_buhome.vbs
	cp ./screenshot.vbs ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_uphome.vbs
	cp ./screenshot.vbs ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_email.vbs
	cp ./screenshot.vbs ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_viewform.vbs
	cp ./screenshot.vbs ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_ofdp.vbs
	
	#Replace char 
	#bu home 
	cscript //nologo "textReplace.vbs" "_screenshot" ":screenshot '"$scrn_directory"\bu home' --fullpage" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_buhome.vbs
	#up home 
	cscript //nologo "textReplace.vbs" "_screenshot" ":screenshot '"$scrn_directory"\up home' --fullpage" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_uphome.vbs
	#emal 
	cscript //nologo "textReplace.vbs" "_screenshot" ":screenshot '"$scrn_directory"\email' --fullpage" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_email.vbs
	#vieform
	cscript //nologo "textReplace.vbs" "_screenshot" ":screenshot '"$scrn_directory"\viewform' --fullpage" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_viewform.vbs
	#ofdp 
	cscript //nologo "textReplace.vbs" "_screenshot" ":screenshot '"$scrn_directory"\ofdp' --fullpage" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot_ofdp.vbs
	
	
else
	echo "File not found."
fi

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
echo $db_name".sql" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/db_name.txt

#start browser 
#start ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/client_webB.sh
#start ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/db_link.sh
start notepad.exe ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"

if [ -e "./db_link.vbs" ]
then
	echo "File existing"
	cp ./db_link.vbs ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/db_link.vbs
	cscript //nologo "textReplace.vbs" "db_link" "$db_link" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/db_link.vbs
	cscript //nologo "textReplace.vbs" "db_username" "$db_username" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/db_link.vbs
	cscript //nologo "textReplace.vbs" "db_password" "$db_password" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/db_link.vbs
	cscript //nologo ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/db_link.vbs
	
else 
	echo "File not found"
fi

#s3://proweaver-files/TECH/Ideal Home Health Services Inc./version2/October-1-2024-RicoLa/screenshot/

echo "                     " >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "#==== SCREENSHOT FILE PATH =====" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"
echo "scrn_path=$scrn_path_final" >> ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$client_web".txt"

file_name="form_conversion.txt"
if [ -e "./template/$file_name" ]
then
	cp ./template/$file_name ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
	cscript //nologo "textReplace.vbs" "account_name" "$client_name" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
	
else
	echo "File not found."
fi

#page_name 
read -p "Enter page name:" page_name 
while [[ "${page_name}" == "" ]] ; do
   read -p "Enter page name:" page_name   
done
cscript //nologo "textReplace.vbs" "page_name" "$page_name" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#fillable_form_title 
read -p "Enter form title:" form_name 
while [[ "${form_name}" == "" ]] ; do
   read -p "Enter fillable form title:" form_name  
done
cscript //nologo "textReplace.vbs" "form_name" "$form_name" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

read -p "Enter number of form pages converted:" num_page_converted 
while [[ "${num_page_converted}" == "" ]] ; do
   read -p "Enter number of form pages converted:" num_page_converted 
done
cscript //nologo "textReplace.vbs" "num_page_converted" "$num_page_converted" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
#num_page_converted

#form_location
read -p "Enter form location:" form_location 
while [[ "${form_location}" == "" ]] ; do
   read -p "Enter form location:" form_location 
done
#start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "form_location" "$form_location"
cscript //nologo "textReplace.vbs" "form_location" "$form_location" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#account_name
#sed -i -e "s/account_name/${client_name}/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#to_email 
read -p "Enter To email:" to_email 
while [[ "${to_email}" == "" ]] ; do
   read -p "Enter To email:" to_email   
done
#sed -i -e "s/to_email/${to_email}/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
cscript //nologo "textReplace.vbs" "to_email" "$to_email" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#cc_email
read -p "Enter CC email:" cc_email 
while [[ "${cc_email}" == "" ]] ; do
   read -p "Enter CC email:" cc_email 
done
#sed -i -e "s/cc_email/${cc_email}/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
cscript //nologo "textReplace.vbs" "cc_email" "$cc_email" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#to_queue
read -p "Enter To queue email:" to_queue 
while [[ "${to_queue}" == "" ]] ; do
   read -p "Enter To queue email:" to_queue 
done
#sed -i -e "s/to_queue/${to_queue}/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
cscript //nologo "textReplace.vbs" "to_queue" "$to_queue" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#techx_email
read -p "Enter Techx email:" techx_email 
while [[ "${techx_email}" == "" ]] ; do
   read -p "Enter Techx email:" techx_email 
done
#sed -i -e "s/techx_email/${techx_email}/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
cscript //nologo "textReplace.vbs" "techx_email" "$techx_email" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#config_email
read -p "Enter config email:" config_email 
while [[ "${config_email}" == "" ]] ; do
   read -p "Enter config email email:" config_email 
done
#sed -i -e "s/config_email/${config_email}/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
cscript //nologo "textReplace.vbs" "config_email" "$config_email" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#login_link
read -p "Enter OFDP login link:" login_link 
while [[ "${login_link}" == "" ]] ; do
   read -p "Enter OFDP login link:" login_link 
done
#sed -i -e "s/login_link/\"${login_link}\"/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
#start Find_And_Replace.vbs "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name" "login_link" "$login_link"
cscript //nologo "textReplace.vbs" "login_link" "$login_link" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#_username
read -p "Enter username:" _username 
while [[ "${_username}" == "" ]] ; do
   read -p "Enter username:" _username 
done
#sed -i -e "s/_username/${_username}/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
cscript //nologo "textReplace.vbs" "_username" "$_username" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#_password
read -p "Enter password:" _password  
while [[ "${_password}" == "" ]] ; do
   read -p "Enter password:" _password 
done
#sed -i -e "s/_password/${_password}/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
#start Find_And_Replace.vbs "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name" "_password" "$_password"
cscript //nologo "textReplace.vbs" "_password" "$_password" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#git_file_path
read -p "Enter Git file path:" git_file_path 
while [[ "${git_file_path}" == "" ]] ; do
   read -p "Enter Git file path:" git_file_path 
done
#sed -i -e "s/git_file_path/\"${git_file_path}\"/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
#start Find_And_Replace.vbs "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name" "git_file_path" "$git_file_path"
cscript //nologo "textReplace.vbs" "git_file_path" "$git_file_path" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

echo "$git_file_path" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/git_file_path.txt 

#sed -i -e "s/scrn_file_path/\"$scrn_path_final\"/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#website_link
if [ -e "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/website_link.txt" ]
then
    website_link="$(<./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/website_link.txt)"
	#sed -i -e "s/website_link/\"$website_link\"/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
	#start Find_And_Replace.vbs "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name" "website_link" "$website_link"
	cscript //nologo "textReplace.vbs" "website_link" "$website_link" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
else
    #website_link=""
	#start Find_And_Replace.vbs "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name" "website_link" "$website_link"
	cscript //nologo "textReplace.vbs" "website_link" "$website_link" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
fi
#sed -i -e "s/website_link/\"$client_webA\"/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name

#echo "The Screenshot File Path: " $scrn_path
#sed -i -e "s/$var1/$var2/g" /google.com.txt
echo "-------------------"
	echo "You can proceed by pressing Y key if you're done,"
	echo "the screesnshot and backup"
	echo "-------------------"
read -p "Enter Y to proceed:" _y 

while [[ "${_y}" == "" ]] ; do
#read -p "Enter Y to proceed:" _y 
   if [ "${_y}" == "Y" ]; then
		#echo "You type uppercase letter $_y"
		echo ""
		break
	elif [ "${_y}" == "y" ]; then
		#echo "You type small letter $_y"
		echo ""
		break
			
	else 
	echo "You typed key: $_y"
	
	#break 
	fi 
	echo "-------------------"
	echo "You can proceed by pressing Y key if you're done,"
	echo "the screesnshot and backup"
	echo "-------------------"
	read -p "Enter Y to proceed:" _y 
	
done 

while [[ "${_y}" != "Y" && "${_y}" != "y" ]] ; do
	#read -p "Enter Y to proceed:" _y 
	if [ "${_y}" == "Y" ]; then
		#echo "You type uppercase letter $_y"
		echo ""
		break
	elif [ "${_y}" == "y" ]; then
		#echo "You type small letter $_y"
		echo ""
		break
			
	else 
	echo "You typed key: $_y"
	
	#break
	
	fi
	echo "-------------------"
	echo "You can proceed by pressing Y key if you're done,"
	echo "the screesnshot and backup"
	echo "-------------------"
	read -p "Enter Y to proceed:" _y 
	
done

# Directory to be zipped
#bu='./$folderB/$myfolderA/$client_web/bu'
bu='bu'

#Check the file or folder exists or not
if [[ -d "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/bu"  ||  -e "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/bu" ]]; then
    #Read filename without extension and
    #add .tar extension to create the compressed file
	cd ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/
    filename="${bu%.*}.tar.zip"
    #Create the compressed file by using the `tar` command
    tar --create --file="$filename" "$bu"
    #Print the success message
    echo "The compressed file is created successfully."
	
	cd ../../../../../
	
else
    #Print the error message
    echo "File or Folder name does not exist: $bu"
fi

#up='./$folderB/$myfolderA/$client_web/up'
up='up'

#Check the file or folder exists or not
if [[ -d "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/up"  ||  -e "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/up" ]]; then
    #Read filename without extension and
    #add .tar extension to create the compressed file
	cd ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web
    filename="${up%.*}.tar.zip"
    #Create the compressed file by using the `tar` command
    tar --create --file="$filename" "$up"
    #Print the success message
    echo "The compressed file is created successfully."
	cd ../../../../../
else
    #Print the error message
    echo "File or Folder name does not exist: $up"
fi

#run git =====================================
./git_v4.sh 
#run git =====================================

folder_B="$(<./month.txt)"
myfolderC=$(date '+%d-%Y')
#echo $myfolderC
s3_folder=$folder_B-$myfolderC-RicoLa

if [ ! -d "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$s3_folder" ]; then
    #echo "Folder not exist";
	mkdir -p "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$s3_folder";
	
	else 
	echo "Folder name $s3_folder already exist";
	
fi

if [ ! -d "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot" ]; then
	echo "Screenshot folder not exist"
	else 
	#cp -rf ./template ./programs
	cp -rf ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/screenshot ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$s3_folder
fi 

if [ -e "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/bu.tar.zip" ]
then
    mv ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/bu.tar.zip ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$s3_folder/bu.tar.zip 
else
    echo "File name bu.tar.zip not exist";
fi
#
if [ -e "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/up.tar.zip" ]
then
    mv ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/up.tar.zip ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$s3_folder/up.tar.zip 
else
    echo "File name up.tar.zip not exist";
fi
#open folder 

#scrn_file_path
#scrn_file_path=$scrn_path_final
read -p "Enter Screenshot File Path:" scrn_path 
#echo "The Screenshot File Path: " $scrn_path

while [[ "${scrn_path}" == "" ]] ; do
   
   read -p "Enter Screenshot File Path:" scrn_path 
   #echo "The Screenshot File Path: " $scrn_path

  #(( i += 1 ))
done

echo "$scrn_path" | sed -r 's/^.{5}//' > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/scrn.txt

if [ -e "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/scrn.txt" ]
then
    scrn_txt="$(<./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/scrn.txt)"
else
    scrn_txt=""
fi


#scrn_path_pre="$scrn_path" | sed -r 's/^.{5}//'
scrn_path_final="https://s3.console.aws.amazon.com/s3/buckets/"$scrn_txt
#echo "The Screenshot File Path: " $scrn_txt
echo "The Screenshot File Path: " $scrn_path_final
echo "$scrn_path_final" > ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/scrn_out.txt

if [ -e "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/scrn_out.txt" ]
then
    scrn_out="$(<./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/scrn_out.txt)"
	#sed -i -e "s/scrn_file_path/\"$scrn_out\"/g" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
	#start Find_And_Replace.vbs "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name" "scrn_file_path" "$scrn_out"
	cscript //nologo "textReplace.vbs" "scrn_file_path" "$scrn_out" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
else
    #scrn_out=""
	#start Find_And_Replace.vbs "./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name" "scrn_file_path" "$scrn_path_final"
	cscript //nologo "textReplace.vbs" "scrn_file_path" "$scrn_path_final" ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name
fi

#cp ./template/$file_name ./$folderA/$tempFolder/$folderB/$myfolderA/$client_web/$file_name