#!/bin/bash 
#chmod u+x run_all.sh 

#date '+%B %d'
#date '+%B'

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
echo "task_ID.txt" > ./$folderB/$myfolderA/$client_web/task_ID.txt 

#screenshot Directory 
scrn_directory='D:\RICLANGUE-FILES\'$folderB'\'$myfolderA'\'$client_web'\screenshot'
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

#!/bin/bash
# Bash Menu Script Example

PS3='Select form template: '
options=("PDQA Form" "RWC Form" "Form Conversion" "Regular Blog" "Custom Blog" "Regular Testimonial" "Custom Testimonial" "Form Activation" "Fillable Pdf" "Login" "Upload" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "PDQA Form")
            echo "you chose choice $REPLY which is $opt"
			file_name="pdqa_form.txt"
			#cp ./template/pdqa_form.txt ./$folderB/$myfolderA/$client_web/pdqa_form.txt
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/pdqa_form.txt ./$folderB/$myfolderA/$client_web/$file_name
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
				
			else
				echo "File not found."
			fi
			
			break
            ;;
        "RWC Form")
            echo "you chose choice $REPLY which is $opt"
			file_name="rwc_form.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			break
			
            ;;
        "Form Conversion")
            echo "you chose choice $REPLY which is $opt"
			file_name="form_conversion.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/form_conversion.txt ./$folderB/$myfolderA/$client_web/form_conversion.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			#page_name 
			read -p "Enter page name:" page_name 
			while [[ "${page_name}" == "" ]] ; do
			   read -p "Enter page name:" page_name   
			done
			sed -i -e "s/page_name/${page_name}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			#fillable_form_title 
			read -p "Enter form title:" form_name 
			while [[ "${form_name}" == "" ]] ; do
			   read -p "Enter fillable form title:" form_name  
			done
			sed -i -e "s/form_name/${form_name}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			read -p "Enter number of fillable pdf pages converted:" num_page_converted 
			while [[ "${num_page_converted}" == "" ]] ; do
			   read -p "Enter number of fillable pdf pages converted:" num_page_converted 
			done
			sed -i -e "s/num_page_converted/${num_page_converted}/g" ./$folderB/$myfolderA/$client_web/$file_name
			#num_page_converted
			
			#form_location
			read -p "Enter form location:" form_location 
			while [[ "${form_location}" == "" ]] ; do
			   read -p "Enter form location:" form_location 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "form_location" "$form_location"
			
			break
			
            ;;
		"Regular Blog")
            echo "you chose choice $REPLY which is $opt"
			file_name="regular_blog.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/regular_blog.txt ./$folderB/$myfolderA/$client_web/regular_blog.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			#blog_link
			read -p "Enter Blog link:" blog_link 
			while [[ "${blog_link}" == "" ]] ; do
			   read -p "Enter Blog link:" blog_link 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "blog_link" "$blog_link"
			
			#form_location
			read -p "Enter form location:" form_location 
			while [[ "${form_location}" == "" ]] ; do
			   read -p "Enter form location:" form_location 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "form_location" "$form_location"
			
			#_nickname 
			read -p "Enter nickname:" _nickname 
			while [[ "${_nickname}" == "" ]] ; do
			   read -p "Enter nickname:" _nickname   
			done
			sed -i -e "s/_nickname/${_nickname}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			break
			
            ;;
		"Custom Blog")
            echo "you chose choice $REPLY which is $opt"
			file_name="custom_blog.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/custom_blog.txt ./$folderB/$myfolderA/$client_web/custom_blog.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			custom_blog_guide="blog_guide.txt"
			if [ -e "./template/$custom_blog_guide" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/custom_blog.txt ./$folderB/$myfolderA/$client_web/custom_blog.txt
				cp ./template/$custom_blog_guide ./$folderB/$myfolderA/$client_web/$custom_blog_guide
				
				echo "notepad.exe $custom_blog_guide" > ./$folderB/$myfolderA/$client_web/blog_guide.bat
				start ./$folderB/$myfolderA/$client_web/blog_guide.bat 
				
			else
				echo "File not found."
			fi
					
			
			#blog_link
			read -p "Enter Blog link:" blog_link 
			while [[ "${blog_link}" == "" ]] ; do
			   read -p "Enter Blog link:" blog_link 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "blog_link" "$blog_link"
			
			#form_location
			read -p "Enter form location:" form_location 
			while [[ "${form_location}" == "" ]] ; do
			   read -p "Enter form location:" form_location 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "form_location" "$form_location"
			
			#_nickname 
			read -p "Enter nickname:" _nickname 
			while [[ "${_nickname}" == "" ]] ; do
			   read -p "Enter nickname:" _nickname   
			done
			sed -i -e "s/_nickname/${_nickname}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			break
			
            ;;
		"Regular Testimonial")
            echo "you chose choice $REPLY which is $opt"
			file_name="regular_testimonial.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/regular_testimonial.txt ./$folderB/$myfolderA/$client_web/regular_testimonial.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			#testimonial_link
			read -p "Enter Testimonial link:" testimonial_link 
			while [[ "${testimonial_link}" == "" ]] ; do
			   read -p "Enter Testimonial link:" testimonial_link 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "testimonial_link" "$testimonial_link"
			
			#_nickname 
			read -p "Enter nickname:" _nickname 
			while [[ "${_nickname}" == "" ]] ; do
			   read -p "Enter nickname:" _nickname   
			done
			sed -i -e "s/_nickname/${_nickname}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			break
			
            ;;
		"Custom Testimonial")
            echo "you chose choice $REPLY which is $opt"
			file_name="custom_testimonial.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/custom_testimonial.txt ./$folderB/$myfolderA/$client_web/custom_testimonial.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			#testimonial_link
			read -p "Enter Testimonial link:" testimonial_link 
			while [[ "${testimonial_link}" == "" ]] ; do
			   read -p "Enter Testimonial link:" testimonial_link 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "testimonial_link" "$testimonial_link"
			
			#_nickname 
			read -p "Enter nickname:" _nickname 
			while [[ "${_nickname}" == "" ]] ; do
			   read -p "Enter nickname:" _nickname   
			done
			sed -i -e "s/_nickname/${_nickname}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			break
			
            ;;
			
			"Form Activation")
            echo "you chose choice $REPLY which is $opt"
			file_name="form_activation.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/login_activation.txt ./$folderB/$myfolderA/$client_web/login_activation.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			read -p "Enter form title:" form_name 
			while [[ "${form_name}" == "" ]] ; do
			   read -p "Enter fillable form title:" form_name  
			done
			sed -i -e "s/form_name/${form_name}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			#form_location
			read -p "Enter form location:" form_location 
			while [[ "${form_location}" == "" ]] ; do
			   read -p "Enter form location:" form_location 
			done
			sed -i -e "s/form_name/${form_name}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			break
			
            ;;
			
			"Fillable Pdf")
            echo "you chose choice $REPLY which is $opt"
			file_name="filallable_pdf_form.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/login_activation.txt ./$folderB/$myfolderA/$client_web/login_activation.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			#page_name 
			read -p "Enter page name:" page_name 
			while [[ "${page_name}" == "" ]] ; do
			   read -p "Enter page name:" page_name   
			done
			sed -i -e "s/page_name/${page_name}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			#fillable_form_title 
			read -p "Enter fillable form title:" fillable_pdf_form_title 
			while [[ "${fillable_pdf_form_title}" == "" ]] ; do
			   read -p "Enter fillable form title:" fillable_pdf_form_title  
			done
			sed -i -e "s/fillable_pdf_form_title/${fillable_pdf_form_title}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			read -p "Enter number of fillable pdf pages:" total_num_pages_pdf 
			while [[ "${total_num_pages_pdf}" == "" ]] ; do
			   read -p "Enter number of fillable pdf pages:" total_num_pages_pdf  
			done
					
			date_finished="$(date -d "$date +$total_num_pages_pdf days" +"%A, %B %d, %Y")"
			echo $date_finished
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "date_finished" "$date_finished"
			
			read -p "Enter number of fillable pdf pages converted:" num_page_converted 
			while [[ "${num_page_converted}" == "" ]] ; do
			   read -p "Enter number of fillable pdf pages converted:" num_page_converted 
			done
			sed -i -e "s/num_page_converted/${num_page_converted}/g" ./$folderB/$myfolderA/$client_web/$file_name
			#num_page_converted
			
			#form_location
			read -p "Enter form location:" form_location 
			while [[ "${form_location}" == "" ]] ; do
			   read -p "Enter form location:" form_location 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "form_location" "$form_location"
			
			break
			
            ;;
			
		"Login")
            echo "you chose choice $REPLY which is $opt"
			file_name="login_activation.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/login_activation.txt ./$folderB/$myfolderA/$client_web/login_activation.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			#page_title
			read -p "Enter page tile:" page_title 
			while [[ "${page_title}" == "" ]] ; do
			   read -p "Enter page tile:" page_title 
			done
			sed -i -e "s/page_title/${page_title}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			#page_link
			read -p "Enter page link:" page_link 
			while [[ "${page_link}" == "" ]] ; do
			   read -p "Enter page link:" page_link 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "page_link" "$page_link"
			
			echo "====================="
			echo "FOR MULTIPLE LOGIN"
			echo "====================="
			
			#page_title1
			read -p "Enter page tile 1:" page_title1 
			while [[ "${page_title1}" == "" ]] ; do
			   read -p "Enter page tile 1:" page_title1 
			done
			sed -i -e "s/page_title1/${page_title1}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			#page_title2
			read -p "Enter page tile 2:" page_title2 
			while [[ "${page_title2}" == "" ]] ; do
			   read -p "Enter page tile 2:" page_title2 
			done
			sed -i -e "s/page_title2/${page_title2}/g" ./$folderB/$myfolderA/$client_web/$file_name
						
			#page_link1
			read -p "Enter page link 1:" page_link1 
			while [[ "${page_link1}" == "" ]] ; do
			   read -p "Enter page link 1:" page_link1 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "page_link1" "$page_link1"
			
			#page_link2
			read -p "Enter page link:" page_link2 
			while [[ "${page_link2}" == "" ]] ; do
			   read -p "Enter page link 2:" page_link2 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "page_link2" "$page_link2"
			
			#login_link1
			read -p "Enter login link 1:" login_link1 
			while [[ "${login_link1}" == "" ]] ; do
			   read -p "Enter login link 1:" login_link1 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "login_link1" "$login_link1"
			
			#_username1
			read -p "Enter username 1:" _username1 
			while [[ "${_username1}" == "" ]] ; do
			   read -p "Enter username 1:" _username1 
			done
			sed -i -e "s/_username1/${_username1}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			#_password1
			read -p "Enter password 1:" _password1 
			while [[ "${_password1}" == "" ]] ; do
			   read -p "Enter password 1:" _password1 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "_password1" "$_password1"
			
			#login_link2
			read -p "Enter login link 2:" login_link2 
			while [[ "${login_link2}" == "" ]] ; do
			   read -p "Enter login link 2:" login_link2 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "login_link2" "$login_link2"
			
			#_username2
			read -p "Enter username 2:" _username2 
			while [[ "${_username2}" == "" ]] ; do
			   read -p "Enter username 2:" _username2 
			done
			sed -i -e "s/_username2/${_username2}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			#_password2
			read -p "Enter password 2:" _password2 
			while [[ "${_password2}" == "" ]] ; do
			   read -p "Enter password 2:" _password2 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "_password2" "$_password2"
			
			
			break
			
            ;;
		"Upload")
            echo "you chose choice $REPLY which is $opt"
			file_name="upload_activation.txt"
			if [ -e "./template/$file_name" ]
			then
				#scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
				#cp ./template/upload_activation.txt ./$folderB/$myfolderA/$client_web/upload_activation.txt
				cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name
			else
				echo "File not found."
			fi
			
			#page_title
			read -p "Enter page tile:" page_title 
			while [[ "${page_title}" == "" ]] ; do
			   read -p "Enter page tile:" page_title 
			done
			sed -i -e "s/page_title/${page_title}/g" ./$folderB/$myfolderA/$client_web/$file_name
			
			#page_link
			read -p "Enter page link:" page_link 
			while [[ "${page_link}" == "" ]] ; do
			   read -p "Enter page link:" page_link 
			done
			start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "page_link" "$page_link"
			
			break
			
            ;;
			
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

#account_name
sed -i -e "s/account_name/${client_name}/g" ./$folderB/$myfolderA/$client_web/$file_name

#to_email 
read -p "Enter To email:" to_email 
while [[ "${to_email}" == "" ]] ; do
   read -p "Enter To email:" to_email   
done
sed -i -e "s/to_email/${to_email}/g" ./$folderB/$myfolderA/$client_web/$file_name

#cc_email
read -p "Enter CC email:" cc_email 
while [[ "${cc_email}" == "" ]] ; do
   read -p "Enter CC email:" cc_email 
done
sed -i -e "s/cc_email/${cc_email}/g" ./$folderB/$myfolderA/$client_web/$file_name

#to_queue
read -p "Enter To queue email:" to_queue 
while [[ "${to_queue}" == "" ]] ; do
   read -p "Enter To queue email:" to_queue 
done
sed -i -e "s/to_queue/${to_queue}/g" ./$folderB/$myfolderA/$client_web/$file_name

#techx_email
read -p "Enter Techx email:" techx_email 
while [[ "${techx_email}" == "" ]] ; do
   read -p "Enter Techx email:" techx_email 
done
sed -i -e "s/techx_email/${techx_email}/g" ./$folderB/$myfolderA/$client_web/$file_name

#config_email
read -p "Enter config email:" config_email 
while [[ "${config_email}" == "" ]] ; do
   read -p "Enter config email email:" config_email 
done
sed -i -e "s/config_email/${config_email}/g" ./$folderB/$myfolderA/$client_web/$file_name

#login_link
read -p "Enter login link:" login_link 
while [[ "${login_link}" == "" ]] ; do
   read -p "Enter login link:" login_link 
done
#sed -i -e "s/login_link/\"${login_link}\"/g" ./$folderB/$myfolderA/$client_web/$file_name
start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "login_link" "$login_link"

#_username
read -p "Enter username:" _username 
while [[ "${_username}" == "" ]] ; do
   read -p "Enter username:" _username 
done
sed -i -e "s/_username/${_username}/g" ./$folderB/$myfolderA/$client_web/$file_name

#_password
read -p "Enter password:" _password  
while [[ "${_password}" == "" ]] ; do
   read -p "Enter password:" _password 
done
#sed -i -e "s/_password/${_password}/g" ./$folderB/$myfolderA/$client_web/$file_name
start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "_password" "$_password"

#git_file_path
read -p "Enter Git file path:" git_file_path 
while [[ "${git_file_path}" == "" ]] ; do
   read -p "Enter Git file path:" git_file_path 
done
#sed -i -e "s/git_file_path/\"${git_file_path}\"/g" ./$folderB/$myfolderA/$client_web/$file_name
start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "git_file_path" "$git_file_path"

echo "$git_file_path" > ./$folderB/$myfolderA/$client_web/git_file_path.txt 

#sed -i -e "s/scrn_file_path/\"$scrn_path_final\"/g" ./$folderB/$myfolderA/$client_web/$file_name

#website_link
if [ -e "./$folderB/$myfolderA/$client_web/website_link.txt" ]
then
    website_link="$(<./$folderB/$myfolderA/$client_web/website_link.txt)"
	#sed -i -e "s/website_link/\"$website_link\"/g" ./$folderB/$myfolderA/$client_web/$file_name
	start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "website_link" "$website_link"
else
    #website_link=""
	start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "website_link" "$website_link"
fi
#sed -i -e "s/website_link/\"$client_webA\"/g" ./$folderB/$myfolderA/$client_web/$file_name

#echo "The Screenshot File Path: " $scrn_path
#sed -i -e "s/$var1/$var2/g" /google.com.txt

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
	
	read -p "Enter Y to proceed:" _y 
	
done

# Directory to be zipped
#bu='./$folderB/$myfolderA/$client_web/bu'
bu='bu'

#Check the file or folder exists or not
if [[ -d "./$folderB/$myfolderA/$client_web/bu"  ||  -e "./$folderB/$myfolderA/$client_web/bu" ]]; then
    #Read filename without extension and
    #add .tar extension to create the compressed file
	cd ./$folderB/$myfolderA/$client_web
    filename="${bu%.*}.tar.zip"
    #Create the compressed file by using the `tar` command
    tar --create --file="$filename" "$bu"
    #Print the success message
    echo "The compressed file is created successfully."
	
	cd ../../../
	
else
    #Print the error message
    echo "File or Folder name does not exist: $bu"
fi

#up='./$folderB/$myfolderA/$client_web/up'
up='up'

#Check the file or folder exists or not
if [[ -d "./$folderB/$myfolderA/$client_web/up"  ||  -e "./$folderB/$myfolderA/$client_web/up" ]]; then
    #Read filename without extension and
    #add .tar extension to create the compressed file
	cd ./$folderB/$myfolderA/$client_web
    filename="${up%.*}.tar.zip"
    #Create the compressed file by using the `tar` command
    tar --create --file="$filename" "$up"
    #Print the success message
    echo "The compressed file is created successfully."
	cd ../../../
else
    #Print the error message
    echo "File or Folder name does not exist: $up"
fi

#run git =====================================
./git_v3.sh 
#run git =====================================

folder_B="$(<./month.txt)"
myfolderC=$(date '+%d-%Y')
#echo $myfolderC
s3_folder=$folder_B-$myfolderC-RicoLa

if [ ! -d "./$folderB/$myfolderA/$client_web/$s3_folder" ]; then
    #echo "Folder not exist";
	mkdir -p "./$folderB/$myfolderA/$client_web/$s3_folder";
	
	else 
	echo "Folder name $s3_folder already exist";
	
fi

if [ ! -d "./$folderB/$myfolderA/$client_web/screenshot" ]; then
	echo "Screenshot folder not exist"
	else 
	#cp -rf ./template ./programs
	cp -rf ./$folderB/$myfolderA/$client_web/screenshot ./$folderB/$myfolderA/$client_web/$s3_folder
fi 

if [ -e "./$folderB/$myfolderA/$client_web/bu.tar.zip" ]
then
    mv ./$folderB/$myfolderA/$client_web/bu.tar.zip ./$folderB/$myfolderA/$client_web/$s3_folder/bu.tar.zip 
else
    echo "File name bu.tar.zip not exist";
fi
#
if [ -e "./$folderB/$myfolderA/$client_web/up.tar.zip" ]
then
    mv ./$folderB/$myfolderA/$client_web/up.tar.zip ./$folderB/$myfolderA/$client_web/$s3_folder/up.tar.zip 
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

echo "$scrn_path" | sed -r 's/^.{5}//' > ./$folderB/$myfolderA/$client_web/scrn.txt

if [ -e "./$folderB/$myfolderA/$client_web/scrn.txt" ]
then
    scrn_txt="$(<./$folderB/$myfolderA/$client_web/scrn.txt)"
else
    scrn_txt=""
fi


#scrn_path_pre="$scrn_path" | sed -r 's/^.{5}//'
scrn_path_final="https://s3.console.aws.amazon.com/s3/buckets/"$scrn_txt
#echo "The Screenshot File Path: " $scrn_txt
echo "The Screenshot File Path: " $scrn_path_final
echo "$scrn_path_final" > ./$folderB/$myfolderA/$client_web/scrn_out.txt

if [ -e "./$folderB/$myfolderA/$client_web/scrn_out.txt" ]
then
    scrn_out="$(<./$folderB/$myfolderA/$client_web/scrn_out.txt)"
	#sed -i -e "s/scrn_file_path/\"$scrn_out\"/g" ./$folderB/$myfolderA/$client_web/$file_name
	start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "scrn_file_path" "$scrn_out"
else
    #scrn_out=""
	start Find_And_Replace.vbs "./$folderB/$myfolderA/$client_web/$file_name" "scrn_file_path" "$scrn_path_final"
fi

#cp ./template/$file_name ./$folderB/$myfolderA/$client_web/$file_name




