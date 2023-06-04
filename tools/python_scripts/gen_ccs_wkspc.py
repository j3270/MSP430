#!/usr/bin/env python3
# This python script will generate the SAMES CCS Workspace

import os
import sys


def main():

    eclipsePath = os.getenv('CCS_BUILD_TOOL')
    workspacePath = os.getcwd() + '/ccs_workspace'

    projectNames = ['blinky']

    for projectName in projectNames:

        import_command = "{} -noSplash -data {} -application com.ti.ccstudio.apps.projectImport -ccs.location " \
                         "{}\projects\{} -ccs.overwrite".format(eclipsePath, workspacePath, os.getcwd(), projectName)

        print(import_command)
        if os.system(import_command) != 0:
            raise RuntimeError

if __name__ == '__main__':
    main()