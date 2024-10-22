#!/bin/bash 
#chmod u+x run_all.sh 

			echo "----------------------------"
            echo "SCREENSHOT WINDOW"
			echo "----------------------------"
		   if [ -e "./client_file_path.txt" ]
			then
				echo "----------------------------"
				echo "Change directory to $client_file_path"
				echo "----------------------------"
				client_file_path="$(<./client_file_path.txt)"
				
				echo $client_file_path > srn_directory.txt 
				cscript //nologo ./textReplace.vbs "./" "" ./srn_directory.txt
				cscript //nologo ./textReplace.vbs "//" "\\" ./srn_directory.txt
				mydirectory="$(<./mydirectory.txt)"
				srn_directory="$(<./srn_directory.txt)"
				#echo "1"
				echo $mydirectory\\$srn_directory\screenshot > ./scrn_wfile_path.txt
				scrn_path="$(<./scrn_wfile_path.txt)"
				echo $scrn_path
				
				cd $client_file_path
				
				echo $mydirectory\\$srn_directory\screenshot > ./scrn_wfile_path.txt
				
			else 
				echo "----------------------------"
				echo "path not found"
				echo "----------------------------"
				#cd ./$folderB/$myfolderA/$client_web
				cscript //nologo ./../../../../../textReplace.vbs "./" "" ./../../../../../srn_directory.txt
				cscript //nologo ./../../../../../textReplace.vbs "//" "\\" ./../../../../../srn_directory.txt
				mydirectory="$(<./../../../../../mydirectory.txt)"
				srn_directory="$(<./../../../../../srn_directory.txt)"
				echo $mydirectory\\$srn_directory\screenshot > ./scrn_wfile_path.txt
				scrn_path="$(<./../../../../../scrn_wfile_path.txt)"
				echo $scrn_path
				
				echo "2"
				echo $scrn_path

			fi
			
					
			
			echo "----------------------------"
			echo "Screenshot Windows"
			echo "----------------------------"
			
			read -p "Enter Window Title:" window_title  
			#echo "The client name: " $client_name

			while [[ "${window_title}" == "" ]] ; do
			   read -p "Enter Window Title:" window_title  
			done
			
			read -p "Enter Screenshot filename: " scrn_window 
			
			while [[ "${scrn_window}" == "" ]] ; do
			   read -p "Enter Screenshot filename: " scrn_window 
			done
			
			echo $scrn_window".png" > ./scrn_window.txt
			cscript //nologo ./../../../../../textReplace.vbs " " "-" ./scrn_window.txt
			
			scrn_windowA="$(<./scrn_window.txt)"
			
			
			if [ -e "./screenshot_window.vbs" ]
			then
				echo "screenshot_window.vbs is already existing"
				cp ./../../../../../screenshot_window.vbs ./screenshot_window.vbs
				cscript //nologo ./../../../../../textReplace.vbs "window_title" "$window_title" ./screenshot_window.vbs
				scrn_path="$(<./scrn_wfile_path.txt)"
				cscript //nologo ./../../../../../textReplace.vbs "scrn_wfile_path" "$scrn_path\\$scrn_windowA" ./screenshot_window.vbs
				
			else 
				echo "COPYING screenshot_window.vbs"
				cp ./../../../../../screenshot_window.vbs ./screenshot_window.vbs
				cscript //nologo ./../../../../../textReplace.vbs "window_title" "$window_title" ./screenshot_window.vbs
				scrn_path="$(<./scrn_wfile_path.txt)"
				cscript //nologo ./../../../../../textReplace.vbs "scrn_wfile_path" "$scrn_path\\$scrn_windowA" ./screenshot_window.vbs
			fi 
			
			
			
			scrn_path="$(<./scrn_wfile_path.txt)"
			if [ -e "./scrn_wfile_path.txt" ]
			then
				echo "$scrn_path is existing"
			else 
				echo ""
			fi
					
			cscript //nologo screenshot_window.vbs
			
			#screenshot Directory 
						
			