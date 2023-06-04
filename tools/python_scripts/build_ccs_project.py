#!/usr/bin/env python3
# This python script will build a CCS project in SAMES/CCS_Workspace
# Should be called from root of repo
# Example:
# python .\tools\python_scripts\build_ccs_project.py SaverAM Debug

import os
import sys


def main(projectName, buildConfig):
    
    eclipsePath = os.getenv('CCS_BUILD_TOOL')
    projectPath = './projects/' + projectName
    workspacePath = './ccs_workspace'

    # Build project
    buildCommand = "{} -noSplash -data {} -application com.ti.ccstudio.apps.projectBuild -ccs.projects {} " \
                   "-ccs.configuration {} -ccs.buildType full -ccs.listErrors -ccs.listProblems" \
                   "".format(eclipsePath, workspacePath, projectName, buildConfig)
    print(buildCommand)
    if os.system(buildCommand) != 0:
        raise RuntimeError


if __name__ == '__main__':
    
    # We first make sure we have the right amount of arguments
    if len(sys.argv) != 3:
        sys.exit("Invalid usage. Correct usage: python build_ccs_project.py <projectPath> <projectName> <buildConfig>")

    projectName = sys.argv[1]
    buildConfig = sys.argv[2]

    main(projectName, buildConfig)