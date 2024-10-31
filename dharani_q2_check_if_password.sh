read -p "Enter a password : " y        
if [ ${#y} -eq 8 ]; then
    echo "The password is 8 characters long."
    if [[ $y =~ [0-9] ]]; then
        echo "The password has atleast an integer."
       if [[ $y =~ [A-Z] && $y =~ [a-z] ]]; then
        echo "The password contains at least 1 uppercase and a lowercase."
         if [[ $y =~ [\!\@\#\$\%\^\&\*\(\)\+\_\-]{2} ]]; then
          echo "The password meets all the criteria and has at least 2 special characters."
          echo "Your score is 10: Excellent"
         elif [[ $y =~ [\!\@\#\$\%\^\&\*\(\)\+\_\-] ]]; then
          echo "The password meets all the criteria."
          echo "Your score is 8: strong"
         else
            echo "The password should have at least one special character."
            fi
       else 
       echo 'The pasword should contain at least 1 uppercase and a lowercase '
       fi
    else
        echo "The password should have at least one integer."
    fi
else
    count=0
    [[ "$y" =~ [A-Z] ]] && ((count++))
    [[ "$y" =~ [a-z] ]] && ((count++))
    [[ "$y" =~ [0-9] ]] && ((count++))
    has_special=0
    for (( i=0; i<${#y}; i++ )); do
        char="${y:$i:1}"
        if [[ "$char" =~ [\!\@\#\$\%\^\&\*\(\)\+\_\-] ]]; then
            has_special=1
            break
        fi
    done
    ((has_special == 1)) && ((count++))
    if ((count == 3)); then
        echo "At least 3 conditions are satisfied, score is 7"
    elif ((count == 2)); then
        echo "Score is 4, only 2 conditions satisfied"
    else
        echo "Score is 2"
    fi
fi

