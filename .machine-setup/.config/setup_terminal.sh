
#!/bin/bash

# Install Oh My Zsh: htts://ohmyz.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Wait for the previous command to complete
sleep 1

# Install the powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Oh My Zsh and powerlevel10k theme installed. Please restart your terminal."