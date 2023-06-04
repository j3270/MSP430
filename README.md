# MSP430 Tinkering

## Tools

1. [12.1.0 of CCS](https://www.ti.com/tool/download/CCSTUDIO/12.1.0)
3. [Visual Studio Code](https://code.visualstudio.com/)
4. [Astyle](./tools/AStyle/doc/astyle.html)  is used to maintain a consistent code style
5. [Valgrind](https://valgrind.org/) has been suggested as a tool to look into for static analysis
6. [Unity](http://www.throwtheswitch.org/unity) will be used for unit testing and TDD
7. [CMake](https://cmake.org/), [Ninja](https://ninja-build.org/), and [MSYS2](https://www.msys2.org/) are currently required for building the Unity uint testing framework and unit tests that use it.
8. [Doxygen 1.9.5](https://www.doxygen.nl/) used for documenting code.  If using VS Code get [Doxygen Documentation Generator](https://marketplace.visualstudio.com/items?itemName=cschlosser.doxdocgen) extension

## Getting Started

1. The repo uses the C/C++ toolchain from TI that comes with Code Composer Studio.  Currently, I am using version [12.1.0 of CCS](https://www.ti.com/tool/download/CCSTUDIO/12.1.0)  
2. You will need to add an environment variable to your system named **CCS_BUILD_TOOL** that points to C:\ti\ccs1210\ccs\eclipse\eclipsec.exe
4. [Visual Studio Code](https://code.visualstudio.com/) is another useful tool to download and install.
5. Once you have the tools installed, environment var set and repo cloned, do the following:
    - **!!Add the file ./tools/hooks/pre-commit.txt to ./.git/hooks without the .txt extension!!**
    - Run the following script from the root of the repo, python ./tools/python_scripts/gen_ccs_wkspc.py
        - This will generate a CCS workspace in the root of the repo which is completely ignored, other than the ignore file in it.  
    - **Do not** commit items from the generated workspace
    - The projects in the ./projects folder are tracked and imported into the workspace.
6. To build/debug projects you can use CCS or VS Code and the available python scripts
