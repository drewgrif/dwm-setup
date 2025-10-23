#!/bin/bash

echo "╔════════════════════════════════════════════════════════════╗"
echo "║        ⚠️  THIS REPOSITORY HAS MOVED ⚠️                    ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "This project is now hosted on Codeberg."
echo ""
echo "📍 New location:"
echo "   https://codeberg.org/justaguylinux/dwm-setup"
echo ""
echo "To get the current version:"
echo ""
echo "   cd ~"
echo "   mv dwm-setup dwm-setup-old"
echo "   git clone https://codeberg.org/justaguylinux/dwm-setup"
echo ""
echo "All future updates happen at the new location."
echo ""
read -p "Would you like me to do this automatically? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    cd ~
    if [ -d "dwm-setup-old" ]; then
        echo "⚠️  ~/dwm-setup-old already exists!"
        echo "Please remove or rename it first, then run this script again."
        exit 1
    fi
    mv dwm-setup dwm-setup-old
    git clone https://codeberg.org/justaguylinux/dwm-setup
    echo ""
    echo "✅ Done!"
    echo "   Old repo backed up to: ~/dwm-setup-old"
    echo "   New repo cloned to: ~/dwm-setup"
    echo ""
    echo "You can now run the setup from ~/dwm-setup"
fi
