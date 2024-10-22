#!/bin/bash
echo "-------------------------"
PS3='Select TASK: '
options=("BU SQL" "UP SQL" "SCRN BU HOME" "SCRN UP HOME" "SCRN EMAIL" "SCRN VIEWFORM" "SCRN OFDP" "SCRN OTHER" "SCRN CHROME" "SCRN EDGE" "QUIT")
select opt in "${options[@]}"
do
    case $opt in
        "BU SQL")
          
		  echo "------------------"
            echo "SQL BU BACKUP"
			echo "------------------"
		   if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			pc_user="Production"
			user_path='C://Users/'$pc_user
			download_path=$user_path'/Downloads'
			echo $user_path
			echo $download_path 
			
			if [ ! -d $user_path ]; then
				
				echo "User Directory not exist"
				read -p "Enter PC user name:" pc_user  
				while [[ "${pc_user}" == "" ]] ; do
				   read -p "Enter PC user name:" pc_user   
				done  

				while [[ "${pc_user}" != "" ]] ; do
				   user_path='C://Users/'$pc_user
					download_path=$user_path'/Downloads'
			
				   if [ ! -d $user_path ]; then
						echo "User not existing"
						read -p "Enter PC user name:" pc_user  
				   
				   else  
						echo "User exist"
						break 
				   
				   fi 
								
				done
				
			else 
				echo "User directory is existing"
			
			fi 
						
			user_path='C://Users/'$pc_user
			download_path=$user_path'/Downloads'
			
			if [ -e "./db_name.txt" ]
			then
				db_name="$(<./db_name.txt)"
				#client_file_path="$(<./client_file_path.txt)"
				if [ -e "$download_path/$db_name" ]
				then
					echo "The file is existing"
					mv $download_path/$db_name ./bu/$db_name 
					echo "Move file successfuly to Directory bu folder" 
					cd ../../../../../
				else
					echo "Database file not found"
					echo "Type q to escape"
					read -p "Enter database name: " db_name 

					while [[ "${db_name}" == "" ]] ; do
					#read -p "Enter Y to proceed:" db_name 
					   if [ "${db_name}" == "Q" ]; then
							echo "$db_name: Exit"
							break
						elif [ "${db_name}" == "q" ]; then
							echo "$db_name: Exit"
							break
								
						else 
							echo "Entered db name: $db_name"	
							echo "Type q to escape"
							echo $db_name".sql" > ./db_name.txt
							db_name="$(<./db_name.txt)"
							#client_file_path="$(<./client_file_path.txt)"
							if [ -e "$download_path/$db_name" ]
							then
								echo "The file is existing"
								mv $download_path/$db_name ./bu/$db_name 
								echo "Move file successfuly to Directory bu folder" 
								cd ../../../../../
								break 
								
							else 
								echo "Cannot find the file $db_name"
																
							fi
						
						#break 
						fi 
						echo "Type q to escape"
						read -p "Enter database name: " db_name  
						
					done 

					while [[ "${db_name}" != "Q" && "${db_name}" != "q" ]] ; do
						
						if [ "${db_name}" == "Q" ]; then
							
							echo "$db_name: Exit"
							break
						elif [ "${db_name}" == "q" ]; then
							echo "$db_name: Exit"
							break
								
						else 
							echo "Entered db name: $db_name"	
							echo "Type q to escape"
							echo $db_name".sql" > ./db_name.txt
							db_name="$(<./db_name.txt)"
							#client_file_path="$(<./client_file_path.txt)"
							if [ -e "$download_path/$db_name" ]
							then
								echo "The file is existing"
								mv $download_path/$db_name ./bu/$db_name 
								echo "Move file successfuly to Directory bu folder" 
								cd ../../../../../
								break 
								
							else 
								echo "Cannot find the file $db_name"
																
							fi
						
						#break
						
						fi
						echo "Type q to escape"
						read -p "Enter database name: " db_name 
						
					done
													
				fi 
												
			else
				echo "Cannot find the database file"

			fi
			
						
            ;;
        "UP SQL")
			echo "------------------"
            echo "SQL UP BACKUP"
			echo "------------------"
		   if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			pc_user="Production"
			user_path='C://Users/'$pc_user
			download_path=$user_path'/Downloads'
			echo $user_path
			echo $download_path 
			
			if [ ! -d $user_path ]; then
				
				echo "User Directory not exist"
				read -p "Enter PC user name:" pc_user  
				while [[ "${pc_user}" == "" ]] ; do
				   read -p "Enter PC user name:" pc_user   
				done  

				while [[ "${pc_user}" != "" ]] ; do
				   user_path='C://Users/'$pc_user
					download_path=$user_path'/Downloads'
			
				   if [ ! -d $user_path ]; then
						echo "User not existing"
						read -p "Enter PC user name:" pc_user  
				   
				   else  
						echo "User exist"
						break 
				   
				   fi 
								
				done
				
			else 
				echo "User directory is existing"
			
			fi 
						
			user_path='C://Users/'$pc_user
			download_path=$user_path'/Downloads'
			
			if [ -e "./db_name.txt" ]
			then
				db_name="$(<./db_name.txt)"
				#client_file_path="$(<./client_file_path.txt)"
				if [ -e "$download_path/$db_name" ]
				then
					echo "The file is existing"
					mv $download_path/$db_name ./up/$db_name 
					echo "Move file successfuly to Directory up folder" 
					cd ../../../../../
				else
					echo "Database file not found"
					echo "Type q to escape"
					read -p "Enter database name: " db_name 

					while [[ "${db_name}" == "" ]] ; do
					#read -p "Enter Y to proceed:" db_name 
					   if [ "${db_name}" == "Q" ]; then
							echo "$db_name: Exit"
							break
						elif [ "${db_name}" == "q" ]; then
							echo "$db_name: Exit"
							break
								
						else 
							echo "Entered db name: $db_name"	
							echo "Type q to escape"
							echo $db_name".sql" > ./db_name.txt
							db_name="$(<./db_name.txt)"
							#client_file_path="$(<./client_file_path.txt)"
							if [ -e "$download_path/$db_name" ]
							then
								echo "The file is existing"
								mv $download_path/$db_name ./up/$db_name 
								echo "Move file successfuly to Directory up folder" 
								cd ../../../../../
								break 
								
							else 
								echo "Cannot find the file $db_name"
																
							fi
						
						#break 
						fi 
						echo "Type q to escape"
						read -p "Enter database name: " db_name  
						
					done 

					while [[ "${db_name}" != "Q" && "${db_name}" != "q" ]] ; do
						
						if [ "${db_name}" == "Q" ]; then
							
							echo "$db_name: Exit"
							break
						elif [ "${db_name}" == "q" ]; then
							echo "$db_name: Exit"
							break
								
						else 
							echo "Entered db name: $db_name"	
							echo "Type q to escape"
							echo $db_name".sql" > ./db_name.txt
							db_name="$(<./db_name.txt)"
							#client_file_path="$(<./client_file_path.txt)"
							if [ -e "$download_path/$db_name" ]
							then
								echo "The file is existing"
								mv $download_path/$db_name ./up/$db_name 
								echo "Move file successfuly to Directory up folder" 
								cd ../../../../../
								break 
								
							else 
								echo "Cannot find the file $db_name"
																
							fi
						
						#break
						
						fi
						echo "Type q to escape"
						read -p "Enter database name: " db_name 
						
					done
													
				fi 
												
			else
				echo "Cannot find the database file"

			fi
		
			
            ;;
		"SCRN BU HOME")
			echo "--------------------"
            echo "BU HOME SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./screenshot_buhome.vbs" ]
				then
					echo "STARTING PROCESS BU HOME SCREENSHOT"
					cscript //nologo ./screenshot_buhome.vbs				
									
				else
					echo "screenshot_buhome.vbs is not existing."
					
				fi 
			#break
			
            ;;
        "SCRN UP HOME")
            echo "--------------------"
            echo "UP HOME SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./screenshot_uphome.vbs" ]
				then
					echo "STARTING PROCESS UP HOME SCREENSHOT"
					cscript //nologo ./screenshot_uphome.vbs				
									
				else
					echo "screenshot_buhome.vbs is not existing."
					
				fi 		
			
			#break
			
            ;;
		
		"SCRN EMAIL")
           echo "--------------------"
            echo "EMAIL SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./screenshot_email.vbs" ]
				then
					echo "STARTING PROCESS EMAIL SCREENSHOT"
					cscript //nologo ./screenshot_email.vbs				
									
				else
					echo "screenshot_email.vbs is not existing."
					
				fi 		
			
			#break
			
            ;;
		
		"SCRN VIEWFORM")
             echo "--------------------"
            echo "VIEWFORM SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./screenshot_viewform.vbs" ]
				then
					echo "STARTING PROCESS VIEWFORM SCREENSHOT"
					cscript //nologo ./screenshot_viewform.vbs				
									
				else
					echo "screenshot_viewform.vbs is not existing."
					
				fi 		
			
            ;;
			
		"SCRN OFDP")
             echo "--------------------"
            echo "OFDP SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./screenshot_ofdp.vbs" ]
				then
					echo "STARTING PROCESS OFDP SCREENSHOT"
					cscript //nologo ./screenshot_ofdp.vbs				
									
				else
					echo "screenshot_ofdp.vbs is not existing."
					
				fi 		
			
            ;;
			
		"SCRN OTHER")
           echo "--------------------"
            echo "OTHER SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./scrn_other.sh" ]
				then
					./scrn_other.sh				
									
				else
					echo "scrn_other.sh is not existing."
					cd ../../../../../
					./scrn_other.sh	
					
				fi 
						
            ;;
			
			"SCRN CHROME")
           echo "--------------------"
            echo "CHROME SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./scrn_chrome.sh" ]
				then
					./scrn_chrome.sh				
									
				else
					echo "scrn_other.sh is not existing."
					cd ../../../../../
					./scrn_chrome.sh	
					
				fi 
			
            ;;
			
			"SCRN EDGE")
           echo "--------------------"
            echo "EDGE SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./scrn_edge.sh" ]
				then
					./scrn_edge.sh				
									
				else
					echo "scrn_other.sh is not existing."
					cd ../../../../../
					./scrn_edge.sh	
					
				fi 
			
            ;;
							
        "QUIT") 
			if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				#cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web
				cd ./../../../../../

			fi
			
            break
            ;;
        *) echo "invalid option $REPLY press ENTER KEY to view menu"
				
		;;
    esac
done












