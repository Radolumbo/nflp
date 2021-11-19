#!/usr/bin/bash
echo "Script requires root access to install apts, is this ok? (y for yes, else no)"
read answer
if [[ ! $answer == y ]]; then
    return
fi

if ! dpkg -s python3.9 | grep -q "Status: install ok"; then
    echo -n "Installing python3.9... "
    sudo apt-get install python3.9 > /dev/null
    echo "Done!"
fi

if ! dpkg -s python3.9-venv | grep -q "Status: install ok"; then
    echo -n "Installing python3.9-venv... "
    sudo apt-get install python3.9-venv > /dev/null
    echo "Done!"
fi

if [ ! -d "venv/" ]; then
    echo -n "Creating virtual environment directory (venv/)... "
    python3.9 -m venv venv/
    echo "Done!"
fi

echo -n "Activating virtual environment... "
source venv/bin/activate
echo "Done!"

echo -n "Checking and installing required modules... "
pip install -r requirements.txt > /dev/null
echo "Done!"
