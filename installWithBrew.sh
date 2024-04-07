#!/bin/bash

# Path to the file containing the list of apps to install
APP_LIST_PATH="./brewList.txt"

# Counter for failed installations
FAIL_COUNT=0

# Temporary file to store error messages
ERROR_LOG="install_errors.log"

# Make sure the error log file is empty
> "$ERROR_LOG"

# Read each line in the app list file
while IFS= read -r app; do
    echo "Attempting to install $app..."
    # Attempt to install the app and capture any error messages
    ERROR=$(brew install $app 2>&1 > /dev/null)
    if [ $? -ne 0 ]; then
        # If the installation failed, log the error message
        echo "Failed to install $app. Error: $ERROR" | tee -a "$ERROR_LOG"
        ((FAIL_COUNT++))
    else
        echo "$app installed successfully."
    fi
done < "$APP_LIST_PATH"

# Report the number of failed installations
echo "Installation process completed. $FAIL_COUNT apps failed to install."
if [ $FAIL_COUNT -ne 0 ]; then
    echo "Check $ERROR_LOG for details on the installation errors."
fi