#!/bin/bash
PS3='Select TASK: '
options=("GIT REPO" "GIT CLONE" "GIT ADD ALL FILES BU" "GIT ADD ALL FILES UP" "GIT LOG" "CHANGE REPO" "DEL GIT" "SCRN GIT" "QUIT")
select opt in "${options[@]}"
do 
    case $opt in
        "GIT REPO")
            echo "you chose choice $REPLY $opt"
			#git_file_path
			
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
						
			if [ -e "./git_file_path.txt" ]
			then
				git_file_path="$(<./git_file_path.txt)"
				#cd $client_file_path
				echo "------------------------------"
				echo "Git Repository: $git_file_path"
				echo "------------------------------"
				
				read -p "Enter Git folder name:" git_dir_path 
				while [[ "${git_dir_path}" == "" ]] ; do
				   read -p "Enter Git folder name:" git_dir_path 
				done
				echo "$git_dir_path" > git_dir_path.txt
				
			else
				echo "Git file not found"
				
				read -p "Enter Git file path:" git_file_path 
				while [[ "${git_file_path}" == "" ]] ; do
				   read -p "Enter Git file path:" git_file_path 
				done
				echo "$git_file_path" > git_file_path.txt 
				
				read -p "Enter Git folder name:" git_dir_path 
				while [[ "${git_dir_path}" == "" ]] ; do
				   read -p "Enter Git folder name:" git_dir_path 
				done
				echo "$git_dir_path" > git_dir_path.txt
				
			fi
			
						
			git init
			git remote add origin $git_file_path
			
			#echo "$git_file_path" > git_file_path.txt
				
			#break
            ;;
        "GIT CLONE")
			echo "--------------------------"
            echo "You chose choice $REPLY $opt"
			echo "STARTING CLONE PROCESS"
			echo "--------------------------"
			
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
									
			if [ -e "./git_file_path.txt" ]; then
				echo ""
				
				git_dir_path="$(<./git_dir_path.txt)"
				if [ ! -d ./$git_dir_path ]; then
					echo "Repository Directory not exist"
					
				else
					echo "--------------------------"
					echo "Repository directory existing"
					
					echo "--------------------------"
					
					date +%s > date_txt.txt 
					date_txt="$(<./date_txt.txt)"
					mv $git_dir_path $git_dir_path"_$date_txt.old"
					
					
					echo "Git folder has been renamed to "$git_dir_path"_$date_txt.old"
					echo "--------------------------"
				fi 
				
			else
				echo "--------------------------"
				echo "File not found."
				echo "--------------------------"
			fi 
			
			if [ -e "./git_file_path.txt" ]
			then
				echo "--------------------------"
				echo "git path config existing"
				git_file_path_clone="$(<./git_file_path.txt)"
				echo "--------------------------"
				echo "git clone $git_file_path_clone"
				echo "--------------------------"
				git clone $git_file_path_clone 
				
			else
				echo "--------------------------"
				echo "Git remote repository path not existing."
				echo "Please add repository first."
				echo "--------------------------"
			fi 
			
			#break
			
            ;;
		"GIT ADD ALL FILES BU")
			echo "--------------------------"
            echo "you chose choice $REPLY $opt"
			echo "STARTING GIT PUSH BU"
			echo "--------------------------"
			
			#git add . && git commit -m ' 177446985 - bu ' && git push origin master
			
			if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "--------------------------"
				echo "Client path not found"
				echo "--------------------------"
				#cd ./$folderB/$myfolderA/$client_web
			
			fi
			
			#./git_bu2.sh 
			
			#git_task_id="$(<./task_ID.txt)"
			
			
			
			if [ -e "./git_file_path.txt" ]
				then
				git_file_path="$(<./git_file_path.txt)"
				echo $git_file_path
				
				if [ -e "./task_ID.txt" ]
				then
					echo "task_ID.txt existing"
					git_task_id="$(<./task_ID.txt)"
					#echo $git_task_id
					
					if [ -e "./git_dir_path.txt" ]
					then 
						echo "git_dir_path.txt is existing"
						git_dir_path="$(<./git_dir_path.txt)"
						echo "TEST DIR::: $git_dir_path"
						
						if [ ! -d $git_dir_path ]; then
						echo "Repository Directory not exist"
						
						else
							echo "--------------------------"
							echo "STARTING GIT PUSH PROCESS"
							echo "git push -u origin master"
							echo "--------------------------"
							./../../../../../git_bu2.sh
							cd $git_dir_path
							
							git add .
							git commit -m " $git_task_id - BU "
							git push -u origin master	
							
							cd ../
							
						fi 
						
					else 
						echo "git_dir_path.txt is not existing"
						git_dir_path="$(<./git_dir_path.txt)"
						echo "TEST DIR::: $git_dir_path"
					fi 
					
					
									
				else
					echo "--------------------------"
					echo "task_ID.txt not existing."
					echo "Please add repository first."
					echo "--------------------------"
				fi 
				
				
			else 
				echo "--------------------------"
				echo "Git remote repository path not existing."
				echo "Please add repository first."
				echo "--------------------------"
			
			fi 
			#break
			
            ;;
		"GIT ADD ALL FILES UP")
			echo "--------------------------"
            echo "you chose choice $REPLY $opt"
			echo "STARTING GIT PUSH UP"
			echo "--------------------------"
			#git add . && git commit -m ' 177446985 - bu ' && git push origin master
			
			if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "--------------------------"
				echo "Client path not found"
				echo "--------------------------"
				#cd ./$folderB/$myfolderA/$client_web
			
			fi
			
			#git_task_id="$(<./task_ID.txt)"
			#./git_up.sh 
			
			if [ -e "./git_file_path.txt" ]
				then
				git_file_path="$(<./git_file_path.txt)"
				echo $git_file_path
				
				if [ -e "./task_ID.txt" ]
				then
					echo "task_ID.txt existing"
					git_task_id="$(<./task_ID.txt)"
					#echo $git_task_id
					
					if [ -e "./git_dir_path.txt" ]
					then 
						echo "git_dir_path.txt is existing"
						git_dir_path="$(<./git_dir_path.txt)"
						echo "TEST DIR::: $git_dir_path"
						
						if [ ! -d $git_dir_path ]; then
						echo "Repository Directory not exist"
						
						else
							echo "--------------------------"
							echo "STARTING GIT PUSH PROCESS"
							echo "git push -u origin master"
							echo "--------------------------"
							
							./../../../../../git_up.sh
							
							cd $git_dir_path
							
							git add .
							git commit -m " $git_task_id - UP "
							git push -u origin master	
							
							cd ../
							
						fi 
						
					else 
						echo "git_dir_path.txt is not existing"
						git_dir_path="$(<./git_dir_path.txt)"
						echo "TEST DIR::: $git_dir_path"
					fi 
					
					
									
				else
					echo "--------------------------"
					echo "task_ID.txt not existing."
					echo "Please add repository first."
					echo "--------------------------"
				fi 
				
				
			else 
				echo "--------------------------"
				echo "Git remote repository path not existing."
				echo "Please add repository first."
				echo "--------------------------"
			
			fi 
			#break
			
            ;;
			
		"GIT LOG")
            echo "you chose choice $REPLY $opt"
			
			if [ -e "./client_file_path.txt" ]
			then
				echo "----------------------------"
				echo "Change directory to $client_file_path"
				echo "----------------------------"
				client_file_path="$(<./client_file_path.txt)"
				./scrn_git.sh
				
				cd $client_file_path
			else 
				echo "----------------------------"
				echo "path not found"
				echo "----------------------------"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			git_dir_path="$(<./git_dir_path.txt)"
			echo "TEST DIR::: $git_dir_path"
			
			if [ ! -d $git_dir_path ]; then
			echo "Repository Directory not exist-----"
			
			else
				echo "--------------------------"
				echo "STARTING GIT PUSH PROCESS"
				echo "git push -u origin master"
				echo "--------------------------"
				cd $git_dir_path
				
				git log	
				
				cd ../
				
				cscript //nologo screenshot_window.vbs
				
			fi 
			
			
            ;;
			
		"CHANGE REPO")
            echo "you chose choice $REPLY $opt"
			#git_file_path
			
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
			
			read -p "Enter New Git file path:" git_file_pathb 
				
			while [[ "${git_file_pathb}" == "" ]] ; do
			   read -p "Enter New Git file path:" git_file_pathb 
			done
			
			echo "$git_file_pathb" > git_file_pathb.txt 
			
			if [ ! -d .git ]; then
				echo "Git Directory not exist"
				
			else
				echo "Git Directory already exist"
				cd ./.git 
				if [ -e "config" ]
				then
					#config="$(<./.git/config)"
					git_file_path="$(<./../git_file_path.txt)"
					git_file_pathb="$(<./../git_file_pathb.txt)"
					#url_text="url = $git_file_path #"
					
					start ./../../../../../Find_And_Replace.vbs "config" "$git_file_path" "$git_file_pathb"
					echo "$git_file_pathb" > ./../git_file_path.txt 
					
					git init
					git remote add origin $git_file_pathb
				
				else
					echo "git config not found"
					echo "Pleasa add new repository."
				fi
				
				cd .. 

			fi;
						
			
			
			#break
			
            ;;
		"DEL GIT")
            echo "you chose choice $REPLY $opt"
			
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
			
			if [ ! -d .git ]; then
				echo "git Directory not exist"
				
			else
				echo "git Directory already exist"
				echo "attrib -h .git" >> attrib.bat 
				echo "exit" >> attrib.bat 
				start ./attrib.bat 		
				
				if [ ! -d ./git_bu ]; then
					mkdir -p "./git_bu"
				else
					echo "folder git_bu already existing. "
								
				fi 
				
				cp -rf .git ./git_bu
				#rm ./git_bu/config delete config file or rename by using mv 
				mv ./git_bu/.git/config ./git_bu/.git/config.old 
				echo "folder git_bu backup created successfully. "
				rm -rf .git
				
				if [ -e "./git_file_path.txt" ]
				then
					
					rm ./git_file_path.txt
					echo "git path git_file_path.txt was deleted successfully"
				else 
					echo "git path delete failed"
				fi 	
				
				if [ ! -d .git ]; then
				echo "git Directory was deleted successfully"
			
				else
					echo "git Directory delete failed"
								
				fi;
					
			fi;
			
			#break
			
            ;;
			
			"SCRN GIT")
		echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			./scrn_git.sh 
			
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
				cd ./../../../../../

			fi
			
            break
            ;;
        *) echo "invalid option $REPLY press ENTER KEY to view menu"
				
		;;
    esac
done












