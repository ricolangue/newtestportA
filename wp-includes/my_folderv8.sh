#!/bin/bash
# Bash Menu Script Example
echo "-------------------------"
PS3='Select form template: '
options=("PDQA Form" "RWC Form" "Form Conversion" "Regular Blog" "Custom Blog" "Regular Testimonial" "Custom Testimonial" "Form Activation" "Fillable Pdf" "Login" "Upload" "OTHER FORM" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "PDQA Form")
			echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			#tempFolder="$opt" | sed -E 's/ /-/'
			#echo "$tempFolder" > ./$tempFolder.txt 
			
			./pdqa.sh 
					
			break
            ;;
        "RWC Form")
            #echo "you chose choice $REPLY which is $opt"
			echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			
			./rwc.sh 
			break
			
            ;;
        "Form Conversion")
            #echo "you chose choice $REPLY which is $opt"
			echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			
			./form_conversion.sh 
						
			break
			
            ;;
		"Regular Blog")
            echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			./regular_blog.sh 
			
			break
			
            ;;
		"Custom Blog")
            #echo "you chose choice $REPLY which is $opt"
			echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			./custom_blog.sh 
			
			break
			
            ;;
		"Regular Testimonial")
            #echo "you chose choice $REPLY which is $opt"
			echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			
			./regular_testimonial.sh 
			
			break
			
            ;;
		"Custom Testimonial")
            #echo "you chose choice $REPLY which is $opt"
			echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			
			./custom_testimonial.sh 
			
			break
			
            ;;
			
			"Form Activation")
            #echo "you chose choice $REPLY which is $opt"
			echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			
			./form_activation.sh 
			
			break
			
            ;;
			
			"Fillable Pdf")
            #echo "you chose choice $REPLY which is $opt"
			echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			
			./fillable_pdf.sh 
			
			break
			
            ;;
			
		"Login")
            #echo "you chose choice $REPLY which is $opt"
			echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			
			./login.sh 		
			
			break
			
            ;;
		"Upload")
            #echo "you chose choice $REPLY which is $opt"
			echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			
			./upload.sh 
			
			break
			
            ;;
			
		"OTHER FORM")
            #echo "you chose choice $REPLY which is $opt"
			echo "-------------------------"
            echo "SELECTED TASK: $opt"
			echo "-------------------------"
			
			./other_form.sh 
			
			break
			
            ;;
			
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done





