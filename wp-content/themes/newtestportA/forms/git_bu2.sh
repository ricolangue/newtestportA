#!/bin/bash

			if [ -e "./client_file_path.txt" ]
			then
				echo "----------------------------"
				echo "Change directory to $client_file_path"
				echo "----------------------------"
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else 
				echo "----------------------------"
				echo "path not found"
				echo "----------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./db_name.txt" ]
			then
				db_name="$(<./db_name.txt)"
				#client_file_path="$(<./client_file_path.txt)"
				if [ -e "./bu/$db_name" ]
				then
					echo "-------------------------"
					echo "The file is existing"
					echo "-------------------------"
					git_dir_path="$(<./git_dir_path.txt)"
																		
					if [ ! -d $git_dir_path/db ]; then
						mkdir -p ./$git_dir_path/db
					else 
						echo "-------------------------"
						echo "Directory bu is existing"
						echo "-------------------------"
					fi
			
					cp ./bu/$db_name ./$git_dir_path/db/$db_name 
					echo "Move file successfuly to Directory bu folder" 
					#cd ../../../../../
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
							
							if [ -e "./bu/$db_name" ]
							then
								echo "-------------------------"
								echo "The file is existing"
								echo "-------------------------"
								git_dir_path="$(<./git_dir_path.txt)"
								
								if [ ! -d $git_dir_path ]; then
									mkdir -p ./$git_dir_path/db
								else 
									echo "-------------------------"
									echo "Directory bu is existing"
									echo "-------------------------"
								fi 
								
								if [ ! -d $git_dir_path/db ]; then
									mkdir -p ./$git_dir_path/db
								else 
									echo "-------------------------"
									echo "Directory bu is existing"
									echo "-------------------------"
								fi 
								
								
								cp -rf ./bu/$db_name ./$git_dir_path/db/$db_name 
								echo "Move file successfuly to Directory bu folder" 
								
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
							if [ -e "./bu/$db_name" ]
							then
								echo "-------------------------"
								echo "The file is existing"
								echo "-------------------------"
								git_dir_path="$(<./git_dir_path.txt)"
								
								if [ ! -d $git_dir_path ]; then
									
								else 
									echo "-------------------------"
									echo "Directory $git_dir_path is existing"
									echo "-------------------------"
									
									if [ ! -d $git_dir_path/db ]; then
										mkdir -p ./$git_dir_path/db
									else 
										echo "-------------------------"
										echo "Directory bu is existing"
										echo "-------------------------"
									fi 
									
									
									cp -rf ./bu/$db_name ./$git_dir_path/db/$db_name 
									echo "-------------------------"
									echo "Move file successfuly to Directory db folder"
									echo "-------------------------"
									
								fi 
																 								
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
			
			
			git_dir_path="$(<./git_dir_path.txt)"
			themes_pathA=./bu/$git_dir_path
			forms_pathA=./bu/forms
			onlineforms_pathA=./bu/onlineforms
			
			themes_pathB=$git_dir_path/wp-content/themes/$git_dir_path
			forms_pathB=$git_dir_path/wp-content/themes/$git_dir_path/forms
			onlineforms_pathB=$git_dir_path/onlineforms
			
			if [ ! -d $themes_pathA ]; then
				echo "-------------------------"
				echo "Directory $themes_pathA is not existing"
				echo "-------------------------"
				#mkdir -p ./$git_dir_path/db
			else 
				echo "-------------------------"
				echo "Directory $themes_pathA is existing"
				echo "-------------------------"
				
				if [ ! -d $git_dir_path/wp-content ]; then
					echo "Directory wp-content is not existing"
					mkdir -p ./$git_dir_path/$git_dir_path
					cp -rf $themes_pathA/* ./$git_dir_path/$git_dir_path
					#cp -rf /path/to/data/* /path/to/backup/
					echo "Copy file successfuly to Directory bu folder"
					
				else
					echo "-------------------------"
					echo "Directory wp-content is existing"
					echo "-------------------------"
				
				fi 
				
				if [ ! -d $git_dir_path/wp-content/themes ]; then
					#mkdir -p ./$git_dir_path/wp-content/themes
					echo "Themes directory is not existing"
				else
					echo "-------------------------"
					echo "Directory themes is existing"
					echo "-------------------------"
				
				fi
				
				if [ ! -d $git_dir_path/wp-content/themes/$git_dir_path ]; then
					#mkdir -p ./$git_dir_path/wp-content/themes/$git_dir_path
					echo "-------------------------"
					echo "Directory themes is not existing"
					echo "-------------------------"
					
				else
					echo "-------------------------"
					echo "Directory bu is existing"
					echo "-------------------------"
					
					cp -rf $themes_pathA/* $themes_pathB 
					#cp -rf /path/to/data/* /path/to/backup/
					echo "Copy file successfuly to Directory $themes_pathB folder"
				
				fi
				
				
			
			fi 
			
			if [ ! -d $forms_pathA ]; then
				echo "-------------------------"
				echo "Directory forms is not existing"
				echo "-------------------------"
				#mkdir -p ./$git_dir_path/db
				
			else 
				echo "-------------------------"
				echo "Directory forms is existing"
				echo "-------------------------"
				
				if [ ! -d $git_dir_path/wp-content ]; then
				echo "-------------------------"
					echo "Directory wp-content is not existing"
					echo "-------------------------"
					mkdir -p ./$git_dir_path/forms
					cp -rf $forms_pathA/* ./$git_dir_path/forms
					#cp -rf /path/to/data/* /path/to/backup/
					echo "Copy file successfuly to Directory $forms_pathB folder"
					
				else
					echo "-------------------------"
					echo "Directory bu is existing"
					echo "-------------------------"
				
				fi 
				
				if [ ! -d $git_dir_path/wp-content/themes ]; then
				echo "-------------------------"
					echo "Directory themes is not existing"
					echo "-------------------------"
					#mkdir -p ./$git_dir_path/wp-content/themes
					
				else
					echo "-------------------------"
					echo "Directory forms is existing"
					echo "-------------------------"
				
				fi
				
				if [ ! -d $git_dir_path/wp-content/themes/$git_dir_path ]; then
				echo "-------------------------"
					echo "Directory themes is not existing"
					echo "-------------------------"
					#mkdir -p ./$git_dir_path/wp-content/themes/$git_dir_path
				else
					echo "-------------------------"
					echo "Directory forms is existing"
					echo "-------------------------"
				
				fi
				
				if [ ! -d $git_dir_path/wp-content/themes/$git_dir_path/forms ]; then
				echo "-------------------------"
					echo "Directory forms is not existing"
					echo "-------------------------"
					#mkdir -p ./$git_dir_path/wp-content/themes/$git_dir_path/forms
				else
					echo "-------------------------"
					echo "Directory forms is existing"
					echo "-------------------------"
					
					cp -rf $forms_pathA/* $forms_pathB 
					#cp -rf /path/to/data/* /path/to/backup/
					echo "Copy file successfuly to Directory $forms_pathB folder"
				
				fi
				
				
			
			fi
			
			if [ ! -d $onlineforms_pathA ]; then
				echo "-------------------------"
				echo "Directory onlineforms is not existing"
				echo "-------------------------"
				#mkdir -p ./$git_dir_path/db
			else 
				echo "-------------------------"
				echo "Directory $onlineforms_pathA is existing"
				echo "-------------------------"
				
				if [ ! -d $git_dir_path/onlineforms ]; then
					mkdir -p ./$git_dir_path/onlineforms
				else
					echo "-------------------------"
					echo "Directory $onlineforms_pathA is existing"
					echo "-------------------------"
				
				fi 
				
				cp -rf $onlineforms_pathA/* $onlineforms_pathB 
				#cp -rf /path/to/data/* /path/to/backup/
				echo "Copy file successfuly to Directory bu folder"
			
			fi

			
			
			 