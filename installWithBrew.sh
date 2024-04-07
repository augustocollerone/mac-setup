#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Update and upgrade Homebrew to make sure we're working with the latest version and formulae
brew update
brew upgrade

# Path to the file containing the list of formulae to install
FORMULAE_LIST_PATH="./brewList.txt"

# Counter for failed installations
FAIL_COUNT=0

# Temporary file to store error messages
ERROR_LOG="install_errors.log"
> "$ERROR_LOG" # Clear the log file

# Install each formula from the list
while IFS= read -r formula; do
    echo "Attempting to install $formula..."
    ERROR=$(brew install $formula 2>&1)
    if [ $? -ne 0 ]; then
        echo "Failed to install $formula. Error: $ERROR" | tee -a "$ERROR_LOG"
        ((FAIL_COUNT++))
    else
        echo "$formula installed successfully."
    fi
done < "$FORMULAE_LIST_PATH"

echo "Installation process completed. $FAIL_COUNT formula(e) failed to install."
if [ $FAIL_COUNT -ne 0 ]; then
    echo "Check $ERROR_LOG for details on the installation errors."
fi
