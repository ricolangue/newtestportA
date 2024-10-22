#!/bin/bash
PS3='Select TASK: '
options=("BU SQL" "UP SQL" "SCRN BU HOME" "SCRN UP HOME" "Blog_page_two_posts" "Blog_page_two_posts_admin" "Blog_Page" "Blog_Page_Admin" "Blog_Post_Comment" "Blog_Post_Comment_Admin" "Author_Page" "Category_Page" "Tag_Page" "Blog_Mobile" "Post_Mobile" "Search" "SCRN OTHER" "QUIT")
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
				
		"Blog_page_two_posts")
           echo "--------------------"
            echo "Blog_page_two_posts SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Blog_page_two_posts.vbs" ]
				then
					echo "STARTING PROCESS Blog_page_two_posts SCREENSHOT"
					cscript //nologo ./Blog_page_two_posts.vbs				
									
				else
					echo "screenshot_Blog_page_two_posts.vbs is not existing."
					
				fi 
						
            ;;
			
			"Blog_page_two_posts_admin")
           echo "--------------------"
            echo "Blog_page_two_posts_admin SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Blog_page_two_posts_admin.vbs" ]
				then
					echo "STARTING PROCESS Blog_page_two_posts_admin SCREENSHOT"
					cscript //nologo ./Blog_page_two_posts_admin.vbs				
									
				else
					echo "screenshot_Blog_page_two_posts_admin.vbs is not existing."
					
				fi 
			
			
            ;;
			
			"Blog_Page")
           echo "--------------------"
            echo "Blog_Page SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Blog_Page.vbs" ]
				then
					echo "STARTING PROCESS Blog_Page SCREENSHOT"
					cscript //nologo ./Blog_Page.vbs				
									
				else
					echo "screenshot_Blog_Page.vbs is not existing."
					
				fi 
						
            ;;
			
			"Blog_Page_Admin")
           echo "--------------------"
            echo "Blog_Page_Admin SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Blog_Page_Admin.vbs" ]
				then
					echo "STARTING PROCESS OFDP SCREENSHOT"
					cscript //nologo ./Blog_Page_Admin.vbs				
									
				else
					echo "screenshot_Blog_Page_Admin.vbs is not existing."
					
				fi 
			
			
            ;;
			
			"Blog_Post_Comment")
           echo "--------------------"
            echo "Blog_Post_Comment SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Blog_Post_Comment.vbs" ]
				then
					echo "STARTING PROCESS Blog_Post_Comment SCREENSHOT"
					cscript //nologo ./Blog_Post_Comment.vbs				
									
				else
					echo "screenshot_Blog_Post_Comment.vbs is not existing."
					
				fi 
						
            ;;
			
			"Blog_Post_Comment_Admin")
           echo "--------------------"
            echo "Blog_Post_Comment_Admin SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Blog_Post_Comment_Admin.vbs" ]
				then
					echo "STARTING PROCESS Blog_Post_Comment_Admin SCREENSHOT"
					cscript //nologo ./Blog_Post_Comment_Admin.vbs				
									
				else
					echo "screenshot_Blog_Post_Comment_Admin.vbs is not existing."
					
				fi 
			
            ;;
			
			"Author_Page")
           echo "--------------------"
            echo "Author_Page SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Author_Page.vbs" ]
				then
					echo "STARTING PROCESS Author_Page SCREENSHOT"
					cscript //nologo ./Author_Page.vbs				
									
				else
					echo "screenshot_Author_Page.vbs is not existing."
					
				fi 
			
            ;;
			
			"Category_Page")
           echo "--------------------"
            echo "Category_Page SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Category_Page.vbs" ]
				then
					echo "STARTING PROCESS Category_Page SCREENSHOT"
					cscript //nologo ./Category_Page.vbs				
									
				else
					echo "screenshot_Category_Page.vbs is not existing."
					
				fi 
			
            ;;
			
			"Tag_Page")
           echo "--------------------"
            echo "Tag_Page SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Tag_Page.vbs" ]
				then
					echo "STARTING PROCESS Tag_Page SCREENSHOT"
					cscript //nologo ./Tag_Page.vbs				
									
				else
					echo "screenshot_Tag_Page.vbs is not existing."
					
				fi 
			
            ;;
			
			"Blog_Mobile")
           echo "--------------------"
            echo "Blog_Mobile SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Blog_Mobile.vbs" ]
				then
					echo "STARTING PROCESS Blog_Mobile SCREENSHOT"
					cscript //nologo ./Blog_Mobile.vbs				
									
				else
					echo "screenshot_Blog_Mobile.vbs is not existing."
					
				fi 
			
            ;;
			
			"Post_Mobile")
           echo "--------------------"
            echo "Post_Mobile SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Post_Mobile.vbs" ]
				then
					echo "STARTING PROCESS Post_Mobile SCREENSHOT"
					cscript //nologo ./Post_Mobile.vbs				
									
				else
					echo "screenshot_Post_Mobile.vbs is not existing."
					
				fi 
			
            ;;
			
			"Search")
           echo "--------------------"
            echo "Search SCREENSHOT"
			echo "--------------------"
			 if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./Search.vbs" ]
				then
					echo "STARTING PROCESS Search SCREENSHOT"
					cscript //nologo ./Search.vbs				
									
				else
					echo "screenshot_Search.vbs is not existing."
					
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












