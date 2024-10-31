while true; do
    read -p "Enter desired password length (between 12 and 32): " x
    if [[ "$x" =~ ^[0-9]+$ ]] && [ "$x" -ge 12 ] && [ "$x" -le 32 ]; then
        break
    else
        echo "Invalid input. Please enter a number between 12 and 32."
    fi
done

y=$(cat /dev/urandom | tr -dc 'A-Za-z0-9!@#$%^&*_+-=[]{}|:<>?' | head -c "$x")
echo "Generated password: $y"
echo "Password length: ${#y}"
