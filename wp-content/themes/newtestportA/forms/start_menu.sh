#!/bin/bash
# Bash Menu Script Example
echo "---------------------------"
echo " SELECT TASH "
echo "---------------------------"
PS3='Select TASK: '
options=("RUN TOOLS" "EMAIL VERIFIER" "RUN TASK" "SEARCH USERS" "DB AND SCREENSHOT" "QUIT")
select opt in "${options[@]}"
do
    case $opt in
        "RUN TOOLS")
		echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			./mytools.sh 	
			#break
            ;;
        "EMAIL VERIFIER")
		echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			./verify_email.sh
			#break
			
            ;;
        "RUN TASK")
		echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			./my_folderv8.sh 
			
			#break
			
            ;;
		"SEARCH USERS")
		echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			start https://office.orchestra.tools/users/usersdirectory/user/2987
			
			#break
			
            ;;
		"DB AND SCREENSHOT")
		echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			./screenshot.sh 
			
			#break
			
            ;;
					
        "QUIT")
            break
            ;;
        *) echo "invalid option $REPLY press ENTER KEY to view menu"
		echo "---------------------------"		
		;;
    esac
done

#sed -i -e "s/$var1/$var2/g" /google.com.txt


