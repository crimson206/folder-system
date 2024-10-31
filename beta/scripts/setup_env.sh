# !bin/bash

read -p "Please enter the Python version you want to use (e.g., 3.9): " PYTHON_VERSION

conda create --name folder-system-beta python=$PYTHON_VERSION -y

conda activate folder-system-beta

pip install -r requirements.txt
pip install -r requirements_test.txt
pip install -r requirements_dev.txt

