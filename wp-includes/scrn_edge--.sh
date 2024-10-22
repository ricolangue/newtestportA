#!/bin/bash 
#chmod u+x run_all.sh 

			echo "------------------"
            echo "SCREENSHOT CHROME BROWSER"
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
			
			if [ -e "./scrn_fname.txt" ]
			then
				scrn_fname="$(<./scrn_fname.txt)"
				#client_file_path="$(<./client_file_path.txt)"
				if [ -e "$download_path/$scrn_fname" ]
				then
					echo "The file is existing"
					read -p "Enter Screenshot name: " scrn_newfname
					
					echo $scrn_newfname".png" > scrn_newfname.txt
					cscript //nologo ./../../../../../textReplace.vbs " " "-" ./scrn_newfname.txt
					
					scrn_newfnameA="$(<./scrn_newfname.txt)"
					mv $download_path/$scrn_fname ./screenshot/$scrn_newfnameA
					echo "Move file successfuly to Directory screenshot folder" 
					cd ../../../../../
				else
					echo "Screenshot file not found"
					echo "Type q to escape"
					read -p "Enter Screenshot link: " scrn_fname 
					
					while [[ "${scrn_fname}" == "" ]] ; do
					#read -p "Enter Y to proceed:" scrn_fname 
					   if [ "${scrn_fname}" == "Q" ]; then
							echo "$scrn_fname: Exit"
							break
						elif [ "${scrn_fname}" == "q" ]; then
							echo "$scrn_fname: Exit"
							break
								
						else 
							echo "Entered Screenshot link: $scrn_fname"	
														
							cscript //nologo ./../../../../../screenshot_edge.vbs
							echo $scrn_fname".png" > ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "https://" "" ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "//" "_" ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "?" "_" ./scrn_fname.txt

							scrn_fname="$(<./scrn_fname.txt)"
							#download_path
							if [ -e "$download_path/$scrn_fname" ]
							then
								echo "The file is existing"
								read -p "Enter Screenshot name: " scrn_newfname
								
								echo $scrn_newfname".png" > scrn_newfname.txt
								cscript //nologo ./../../../../../textReplace.vbs " " "-" ./scrn_newfname.txt
								
								scrn_newfnameA="$(<./scrn_newfname.txt)"
								mv $download_path/$scrn_fname ./screenshot/$scrn_newfnameA
								echo "Move file successfuly to Directory screenshot folder" 
								cd ../../../../../
								break 
								
							else 
								echo "Cannot find the file $scrn_fname"
																
							fi
							
							echo "Entered Screenshot link: $scrn_fname"
							echo "Type q to escape"
							read -p "Enter Screenshot link: " scrn_fname
						
						#break 
						fi 
											
					done 

					while [[ "${scrn_fname}" != "Q" && "${scrn_fname}" != "q" ]] ; do
						
						if [ "${scrn_fname}" == "Q" ]; then
							
							echo "$scrn_fname: Exit"
							break
						elif [ "${scrn_fname}" == "q" ]; then
							echo "$scrn_fname: Exit"
							break
								
						else 
							echo "Entered screenshot link: $scrn_fname"	 
							cscript //nologo ./../../../../../screenshot_edge.vbs
							
							echo $scrn_fname".png" > ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "https://" "" ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "//" "_" ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "?" "_" ./scrn_fname.txt
							
							scrn_fname="$(<./scrn_fname.txt)"
							#download_path
							if [ -e "$download_path/$scrn_fname" ]
							then
								echo "The file is existing"
								echo "Type q to escape"
								read -p "Enter Screenshot name: " scrn_newfname
								echo $scrn_newfname".png" > scrn_newfname.txt
								cscript //nologo ./../../../../../textReplace.vbs " " "-" ./scrn_newfname.txt
								
								scrn_newfnameA="$(<./scrn_newfname.txt)"
								mv $download_path/$scrn_fname ./screenshot/$scrn_newfnameA
								echo "Move file successfuly to Directory screenshot folder" 
								cd ../../../../../
								break 
								
							else 
								echo "Cannot find the file $scrn_fname"
																
							fi
							echo "Entered screenshot link: $scrn_fname"
							echo "Type q to escape"
							read -p "Enter Screenshot link: " scrn_fname
						#break
						
						fi
												
					done
													
				fi 
												
			else
				
				echo "Screenshot file not found"
					echo "Type q to escape"
					read -p "Enter Screenshot link: " scrn_fname 
					
					while [[ "${scrn_fname}" == "" ]] ; do
					#read -p "Enter Y to proceed:" scrn_fname 
					   if [ "${scrn_fname}" == "Q" ]; then
							echo "$scrn_fname: Exit"
							break
						elif [ "${scrn_fname}" == "q" ]; then
							echo "$scrn_fname: Exit"
							break
								
						else 
							echo "Entered Screenshot link: $scrn_fname"	
														
							cscript //nologo ./../../../../../screenshot_edge.vbs
							echo $scrn_fname".png" > ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "https://" "" ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "//" "_" ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "?" "_" ./scrn_fname.txt

							scrn_fname="$(<./scrn_fname.txt)"
							#download_path
							if [ -e "$download_path/$scrn_fname" ]
							then
								echo "The file is existing"
								read -p "Enter Screenshot name: " scrn_newfname
								
								echo $scrn_newfname".png" > scrn_newfname.txt
								cscript //nologo ./../../../../../textReplace.vbs " " "-" ./scrn_newfname.txt
								
								scrn_newfnameA="$(<./scrn_newfname.txt)"
								mv $download_path/$scrn_fname ./screenshot/$scrn_newfnameA
								echo "Move file successfuly to Directory screenshot folder" 
								cd ../../../../../
								break 
								
							else 
								echo "Cannot find the file $scrn_fname"
																
							fi
							
							echo "Entered Screenshot link: $scrn_fname"
							echo "Type q to escape"
							read -p "Enter Screenshot link: " scrn_fname
						
						#break 
						fi 
											
					done 

					while [[ "${scrn_fname}" != "Q" && "${scrn_fname}" != "q" ]] ; do
						
						if [ "${scrn_fname}" == "Q" ]; then
							
							echo "$scrn_fname: Exit"
							break
						elif [ "${scrn_fname}" == "q" ]; then
							echo "$scrn_fname: Exit"
							break
								
						else 
							echo "Entered screenshot link: $scrn_fname"	 
							cscript //nologo ./../../../../../screenshot_edge.vbs
							
							echo $scrn_fname".png" > ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "https://" "" ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "//" "_" ./scrn_fname.txt
							cscript //nologo ./../../../../../textReplace.vbs "?" "_" ./scrn_fname.txt
							
							scrn_fname="$(<./scrn_fname.txt)"
							#download_path
							if [ -e "$download_path/$scrn_fname" ]
							then
								echo "The file is existing"
								echo "Type q to escape"
								read -p "Enter Screenshot name: " scrn_newfname
								echo $scrn_newfname".png" > scrn_newfname.txt
								cscript //nologo ./../../../../../textReplace.vbs " " "-" ./scrn_newfname.txt
								
								scrn_newfnameA="$(<./scrn_newfname.txt)"
								mv $download_path/$scrn_fname ./screenshot/$scrn_newfnameA
								echo "Move file successfuly to Directory screenshot folder" 
								cd ../../../../../
								break 
								
							else 
								echo "Cannot find the file $scrn_fname"
																
							fi
							echo "Entered screenshot link: $scrn_fname"
							echo "Type q to escape"
							read -p "Enter Screenshot link: " scrn_fname
						#break
						
						fi
												
					done
					

			fi