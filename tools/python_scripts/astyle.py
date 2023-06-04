#!/usr/bin/env python3
# Runs AStyle on C files over workspace 
# Run from root of repo as below
# python ./tools/python_scripts/astyle.py

import os

def main():

    repoRoot = os.getcwd()
    astylePath = repoRoot + '/tools/AStyle/bin/AStyle.exe'

    astyleCommand = "{} --style=allman  --recursive  --suffix=none".format(astylePath)
    if os.system(astyleCommand) != 0:
        raise RuntimeError
    
if __name__ == '__main__':
    main()