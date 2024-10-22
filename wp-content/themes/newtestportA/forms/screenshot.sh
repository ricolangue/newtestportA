#!/bin/bash
echo "-------------------------"
PS3='Select TASK: '
options=("DB CONNECT" "BU SQL" "UP SQL" "SCRN BU HOME" "SCRN UP HOME" "SCRN EMAIL" "SCRN VIEWFORM" "SCRN OFDP" "SCRN OTHER" "SCRN CHROME" "SCRN EDGE" "QUIT")
select opt in "${options[@]}"
do
    case $opt in
		"DB CONNECT")
			echo "--------------------"
            echo "DB CONNECTION"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "-------------------------"
				echo "path not found"
				echo "-------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./db_link.vbs" ]
				then
					echo "-------------------------"
					echo "STARTING PROCESS DB CONNECTION"
					echo "-------------------------"
					cscript //nologo ./db_link.vbs				
									
				else
					echo "-------------------------"
					echo "db_link.vbs is not existing."
					echo "-------------------------"
					
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
					
					echo $db_name".sql" > ./db_name.txt

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
					
					if [ -e "./../../../../../db_link.vbs" ]
					then
						echo "File existing"
						cp ./../../../../../db_link.vbs ./db_link.vbs
						cscript //nologo "../../../../../textReplace.vbs" "db_link" "$db_link" ./db_link.vbs
						cscript //nologo "../../../../../textReplace.vbs" "db_username" "$db_username" ./db_link.vbs
						cscript //nologo "../../../../../textReplace.vbs" "db_password" "$db_password" ./db_link.vbs
						cscript //nologo ./db_link.vbs
						
					else 
						echo "File not found"
					fi
					
				fi 
			#break
			
            ;;
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
				echo "-------------------------"
				echo "User Directory not exist"
				echo "-------------------------"
				read -p "Enter PC user name:" pc_user  
				while [[ "${pc_user}" == "" ]] ; do
					echo "-------------------------"
				   read -p "Enter PC user name:" pc_user   
				done  

				while [[ "${pc_user}" != "" ]] ; do
				   user_path='C://Users/'$pc_user
					download_path=$user_path'/Downloads'
			
				   if [ ! -d $user_path ]; then
						echo "-------------------------"
						echo "User not existing"
						echo "-------------------------"
						read -p "Enter PC user name:" pc_user  
				   
				   else  
						echo "-------------------------"
						echo "User exist"
						echo "-------------------------"
						break 
				   
				   fi 
								
				done
				
			else 
				echo "-------------------------"
				echo "User directory is existing"
				echo "-------------------------"
			
			fi 
						
			user_path='C://Users/'$pc_user
			download_path=$user_path'/Downloads'
			
			if [ -e "./db_name.txt" ]
			then
				db_name="$(<./db_name.txt)"
				#client_file_path="$(<./client_file_path.txt)"
				if [ -e "$download_path/$db_name" ]
				then
					echo "-------------------------"
					echo "The file is existing"
					echo "-------------------------"
					mv $download_path/$db_name ./bu/$db_name 
					echo "Move file successfuly to Directory bu folder" 
					cd ../../../../../
				else
					echo "-------------------------"
					echo "Database file not found"
					echo "Type q to escape"
					echo "-------------------------"
					read -p "Enter database name: " db_name 

					while [[ "${db_name}" == "" ]] ; do
					#read -p "Enter Y to proceed:" db_name 
					   if [ "${db_name}" == "Q" ]; then
							echo "-------------------------"
							echo "$db_name: Exit"
							echo "-------------------------"
							break
						elif [ "${db_name}" == "q" ]; then
							echo "-------------------------"
							echo "$db_name: Exit"
							echo "-------------------------"
							break
								
						else 
							echo "-------------------------"
							echo "Entered db name: $db_name"	
							echo "Type q to escape"
							echo "-------------------------"
							echo $db_name".sql" > ./db_name.txt
							db_name="$(<./db_name.txt)"
							#client_file_path="$(<./client_file_path.txt)"
							if [ -e "$download_path/$db_name" ]
							then
								echo "-------------------------"
								echo "The file is existing"
								echo "-------------------------"
								mv $download_path/$db_name ./bu/$db_name 
								echo "-------------------------"
								echo "Move file successfuly to Directory bu folder" 
								echo "-------------------------"
								cd ../../../../../
								break 
								
							else 
								echo "-------------------------"
								echo "Cannot find the file $db_name"
								echo "-------------------------"
																
							fi
						
						#break 
						fi 
						echo "-------------------------"
						echo "Type q to escape"
						echo "-------------------------"
						read -p "Enter database name: " db_name  
						
					done 

					while [[ "${db_name}" != "Q" && "${db_name}" != "q" ]] ; do
						
						if [ "${db_name}" == "Q" ]; then
							echo "-------------------------"
							echo "$db_name: Exit"
							echo "-------------------------"
							break
						elif [ "${db_name}" == "q" ]; then
							echo "-------------------------"
							echo "$db_name: Exit"
							echo "-------------------------"
							break
								
						else 
							echo "-------------------------"
							echo "Entered db name: $db_name"	
							echo "Type q to escape"
							echo "-------------------------"
							echo $db_name".sql" > ./db_name.txt
							db_name="$(<./db_name.txt)"
							#client_file_path="$(<./client_file_path.txt)"
							if [ -e "$download_path/$db_name" ]
							then
								echo "-------------------------"
								echo "The file is existing"
								echo "-------------------------"
								mv $download_path/$db_name ./bu/$db_name 
								echo "-------------------------"
								echo "Move file successfuly to Directory bu folder" 
								echo "-------------------------"
								cd ../../../../../
								break 
								
							else 
								echo "-------------------------"
								echo "Cannot find the file $db_name"
								echo "-------------------------"
																
							fi
						
						#break
						
						fi
						echo "-------------------------"
						echo "Type q to escape"
						echo "-------------------------"
						read -p "Enter database name: " db_name 
						
					done
													
				fi 
												
			else
				echo "-------------------------"
				echo "Cannot find the database file"
				echo "-------------------------"

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
				echo "-------------------------"
				echo "path not found"
				echo "-------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			pc_user="Production"
			user_path='C://Users/'$pc_user
			download_path=$user_path'/Downloads'
			echo $user_path
			echo $download_path 
			
			if [ ! -d $user_path ]; then
				echo "-------------------------"
				echo "User Directory not exist"
				echo "-------------------------"
				read -p "Enter PC user name:" pc_user  
				while [[ "${pc_user}" == "" ]] ; do
					echo "-------------------------"
				   read -p "Enter PC user name:" pc_user   
				done  

				while [[ "${pc_user}" != "" ]] ; do
				   user_path='C://Users/'$pc_user
					download_path=$user_path'/Downloads'
			
				   if [ ! -d $user_path ]; then
						echo "-------------------------"
						echo "User not existing"
						echo "-------------------------"
						read -p "Enter PC user name:" pc_user  
				   
				   else  
						echo "-------------------------"
						echo "User exist"
						echo "-------------------------"
						break 
				   
				   fi 
								
				done
				
			else 
				echo "-------------------------"
				echo "User directory is existing"
				echo "-------------------------"
			
			fi 
						
			user_path='C://Users/'$pc_user
			download_path=$user_path'/Downloads'
			
			if [ -e "./db_name.txt" ]
			then
				db_name="$(<./db_name.txt)"
				#client_file_path="$(<./client_file_path.txt)"
				if [ -e "$download_path/$db_name" ]
				then
					echo "-------------------------"
					echo "The file is existing"
					echo "-------------------------"
					mv $download_path/$db_name ./up/$db_name 
					echo "-------------------------"
					echo "Move file successfuly to Directory up folder" 
					echo "-------------------------"
					cd ../../../../../
				else
					echo "-------------------------"
					echo "Database file not found"
					echo "Type q to escape"
					echo "-------------------------"
					read -p "Enter database name: " db_name 

					while [[ "${db_name}" == "" ]] ; do
					#read -p "Enter Y to proceed:" db_name 
					   if [ "${db_name}" == "Q" ]; then
							echo "-------------------------"
							echo "$db_name: Exit"
							echo "-------------------------"
							break
						elif [ "${db_name}" == "q" ]; then
							echo "-------------------------"
							echo "$db_name: Exit"
							echo "-------------------------"
							break
								
						else 
							echo "-------------------------"
							echo "Entered db name: $db_name"	
							echo "Type q to escape"
							echo "-------------------------"
							echo $db_name".sql" > ./db_name.txt
							db_name="$(<./db_name.txt)"
							#client_file_path="$(<./client_file_path.txt)"
							if [ -e "$download_path/$db_name" ]
							then
								echo "-------------------------"
								echo "The file is existing"
								echo "-------------------------"
								mv $download_path/$db_name ./up/$db_name 
								echo "-------------------------"
								echo "Move file successfuly to Directory up folder" 
								echo "-------------------------"
								cd ../../../../../
								break 
								
							else 
								echo "-------------------------"
								echo "Cannot find the file $db_name"
								echo "-------------------------"
																
							fi
						
						#break 
						fi 
						echo "-------------------------"
						echo "Type q to escape"
						echo "-------------------------"
						read -p "Enter database name: " db_name  
						
					done 

					while [[ "${db_name}" != "Q" && "${db_name}" != "q" ]] ; do
						
						if [ "${db_name}" == "Q" ]; then
							echo "-------------------------"
							echo "$db_name: Exit"
							echo "-------------------------"
							break
						elif [ "${db_name}" == "q" ]; then
							echo "-------------------------"
							echo "$db_name: Exit"
							echo "-------------------------"
							break
								
						else 
							echo "-------------------------"
							echo "Entered db name: $db_name"	
							echo "Type q to escape"
							echo "-------------------------"
							echo $db_name".sql" > ./db_name.txt
							db_name="$(<./db_name.txt)"
							#client_file_path="$(<./client_file_path.txt)"
							if [ -e "$download_path/$db_name" ]
							then
								echo "-------------------------"
								echo "The file is existing"
								echo "-------------------------"
								mv $download_path/$db_name ./up/$db_name 
								echo "-------------------------"
								echo "Move file successfuly to Directory up folder" 
								echo "-------------------------"
								cd ../../../../../
								break 
								
							else 
								echo "-------------------------"
								echo "Cannot find the file $db_name"
								echo "-------------------------"
																
							fi
						
						#break
						
						fi
						echo "-------------------------"
						echo "Type q to escape"
						echo "-------------------------"
						read -p "Enter database name: " db_name 
						
					done
													
				fi 
												
			else
				echo "-------------------------"
				echo "Cannot find the database file"
				echo "-------------------------"

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
				echo "-------------------------"
				echo "path not found"
				echo "-------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./screenshot_buhome.vbs" ]
				then
					echo "-------------------------"
					echo "STARTING PROCESS BU HOME SCREENSHOT"
					echo "-------------------------"
					cscript //nologo ./screenshot_buhome.vbs				
									
				else
					echo "-------------------------"
					echo "screenshot_buhome.vbs is not existing."
					echo "-------------------------"
					
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
				echo "-------------------------"
				echo "path not found"
				echo "-------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./screenshot_uphome.vbs" ]
				then
					echo "-------------------------"
					echo "STARTING PROCESS UP HOME SCREENSHOT"
					echo "-------------------------"
					cscript //nologo ./screenshot_uphome.vbs				
									
				else
					echo "-------------------------"
					echo "screenshot_buhome.vbs is not existing."
					echo "-------------------------"
					
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
				echo "-------------------------"
				echo "path not found"
				echo "-------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./screenshot_email.vbs" ]
				then
					echo "-------------------------"
					echo "STARTING PROCESS EMAIL SCREENSHOT"
					echo "-------------------------"
					cscript //nologo ./screenshot_email.vbs				
									
				else
					echo "-------------------------"
					echo "screenshot_email.vbs is not existing."
					echo "-------------------------"
					
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
				echo "-------------------------"
				echo "path not found"
				echo "-------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./screenshot_viewform.vbs" ]
				then
					echo "-------------------------"
					echo "STARTING PROCESS VIEWFORM SCREENSHOT"
					echo "-------------------------"
					cscript //nologo ./screenshot_viewform.vbs				
									
				else
					echo "-------------------------"
					echo "screenshot_viewform.vbs is not existing."
					echo "-------------------------"
					
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
				echo "-------------------------"
				echo "path not found"
				echo "-------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./screenshot_ofdp.vbs" ]
				then
					echo "-------------------------"
					echo "STARTING PROCESS OFDP SCREENSHOT"
					echo "-------------------------"
					cscript //nologo ./screenshot_ofdp.vbs				
									
				else
					echo "-------------------------"
					echo "screenshot_ofdp.vbs is not existing."
					echo "-------------------------"
					
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
				echo "-------------------------"
				echo "path not found"
				echo "-------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./scrn_other.sh" ]
				then
					echo "-------------------------"
					echo "Starting other screenshot"
					echo "-------------------------"
					./scrn_other.sh				
									
				else
					echo "-------------------------"
					echo "scrn_other.sh is not existing."
					echo "-------------------------"
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
				echo "-------------------------"
				echo "Change directory to $client_file_path"
				echo "-------------------------"
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "-------------------------"
				echo "path not found"
				echo "-------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./scrn_chrome.sh" ]
				then
					echo "-------------------------"
					echo "Starting Chrome screenshot"
					echo "-------------------------"
					./scrn_chrome.sh				
									
				else
					echo "-------------------------"
					echo "Searching file scrn_chrome.sh"
					echo "Change directory to main"
					echo "-------------------------"
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
				echo "-------------------------"
				echo "Change directory to $client_file_path"
				echo "-------------------------"
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "-------------------------"
				echo "path not found"
				echo "-------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./scrn_edge.sh" ]
				then
				echo "-------------------------"
				echo "Starting Edge Screenshot"
				echo "-------------------------"
					./scrn_edge.sh				
									
				else
					echo "-------------------------"
					echo "Change directory to main"
					echo "-------------------------"
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
				echo "----------------------------"
				echo "path not found"
				echo "Change directory to main"
				echo "-------------------------"
				#cd ./$folderB/$myfolderA/$client_web
				cd ./../../../../../

			fi
			
            break
            ;;
        *) echo "invalid option $REPLY press ENTER KEY to view menu"
				
		;;
    esac
done












