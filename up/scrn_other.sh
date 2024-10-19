#!/bin/bash
PS3='Select TASK: '
options=("SCRN NEW" "SCRN BLOG" "SCRN TESTIMONIAL" "SCRN NEWS" "SCRN PDQA-RWC" "QUIT")
select opt in "${options[@]}"
do
    case $opt in
        "SCRN NEW")
           echo "------------------"
            echo "SCREENSHOT NEW"
			echo "------------------"
		   
		   read -p "Enter New screenshot name:" scrn_new  
			while [[ "${scrn_new}" == "" ]] ; do
			   read -p "Enter New screenshot name:" scrn_new 
			done  
			
			echo "$scrn_new" > ./scrn_newfile.txt 
			cscript //nologo "textReplace.vbs" " " "-" ./scrn_newfile.txt 
			
			#_scrn_new="${scrn_new}" | sed -E 's/ /-/'
			#scrn_newfile=$_scrn_new".vbs"
						
			if [ -e "./scrn_newfile.txt" ]
			then
				scrn_newfile="$(<./scrn_newfile.txt)"
				echo $scrn_newfile".vbs"											
			else
				echo "$scrn_newfile file not found"
				
			fi
			
			#echo $scrn_newfile
			scrn_newfileA=$scrn_newfile".vbs"
			
		   if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
				cp ../../../../../screenshot.vbs $scrn_newfileA 
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web
				cp ../../../../../screenshot.vbs $scrn_newfileA

			fi
						
			#cp ../../../../../screenshot.vbs "$scrn_newfile"
			
			if [ -e ./$scrn_newfileA ]
				then
				
				if [ -e "./client_dir.txt" ]
					then
						client_dir="$(<./client_dir.txt)"
																							
					else
						echo "file not found"
						#cd ./$folderB/$myfolderA/$client_web

					fi
				
				scrn_directory=$client_dir'\screenshot'
				cscript //nologo "./../../../../../textReplace.vbs" "_screenshot" ":screenshot '"$scrn_directory'\'$scrn_newfile"' --fullpage" ./$scrn_newfileA
				
				cscript //nologo ./$scrn_newfileA
								
									
				else
					echo "$scrn_new.vbs is not existing."
					cd ../../../../../
									
				fi 	
			
									
            ;;
        "SCRN BLOG")
			echo "------------------"
            echo "BLOG BACKUP"
			echo "------------------"
		   if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./scrn_blog.sh" ]
				then
					./scrn_blog.sh 				
									
				else
					echo "scrn_blog.sh is not existing."
					cd ../../../../../
					./scrn_blog.sh 
					
				fi 		
			
            ;;
		"SCRN TESTIMONIAL")
			echo "--------------------"
            echo "TESTIMONIAL SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./scrn_testimonial.sh" ]
				then
					./scrn_testimonial.sh 				
									
				else
					echo "scrn_testimonial.sh is not existing."
					cd ../../../../../
					./scrn_testimonial.sh 
					
				fi 		
			#break
			
            ;;
        "SCRN PDQA-RWC")
            echo "--------------------"
            echo "PDQA-RWC SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./scrn_pdqa.sh" ]
				then
					./scrn_pdqa.sh 				
									
				else
					echo "scrn_pdqa.sh is not existing."
					cd ../../../../../
					./scrn_pdqa.sh 
					
				fi 		
			
			#break
			
            ;;
			
			"SCRN NEWS")
            echo "--------------------"
            echo "PDQA-RWC SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./scrn_pdqa.sh" ]
				then
					./scrn_pdqa.sh 				
									
				else
					echo "scrn_pdqa.sh is not existing."
					cd ../../../../../
					./scrn_pdqa.sh 
					
				fi 		
			
			#break
			
            ;;
			
        "QUIT") 
			if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				#cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web
				cd ./../../../

			fi
			
            break
            ;;
        *) echo "invalid option $REPLY press ENTER KEY to view menu"
				
		;;
    esac
done












