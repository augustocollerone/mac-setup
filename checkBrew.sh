while read app; do
    echo "Checking $app..."
    brew search "$app" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "$app is available on Brew." >> brew_apps.txt
    else
        echo "$app is NOT available on Brew." >> non_brew_apps.txt
    fi
done < custom_apps.txt
