
#CCS_INSTALL_ROOT should point to C:\ti\ccs1210, or something simillar depending on install location and version

if (NOT DEFINED ENV{CCS_INSTALL_ROOT})
	message(FATAL_ERROR "CCS_INSTALL_ROOT environment variable is not defined!")
else()
	message(STATUS "CCS_INSTALL_ROOT equals: $ENV{CCS_INSTALL_ROOT}")
endif()

# Set version being used here.  Multiple versions of the toolchain can be installed at same time
set(MSP430_TOOLCHAIN_ROOT "$ENV{CCS_INSTALL_ROOT}/ccs/tools/compiler/ti-cgt-msp430_21.6.1.LTS/bin")

#cl430 is the cmd line tool that invokes either the asm, c/c++ compiler, or linker depending on flags
find_program(CMAKE_ASM_COMPILER cl430 PATHS "${MSP430_TOOLCHAIN_ROOT}" NO_DEFAULT_PATH)
find_program(CMAKE_C_COMPILER cl430 PATHS "${MSP430_TOOLCHAIN_ROOT}" NO_DEFAULT_PATH)
find_program(CMAKE_CXX_COMPILER cl430 PATHS "${MSP430_TOOLCHAIN_ROOT}" NO_DEFAULT_PATH)
find_program(CMAKE_C_LINK_EXECUTABLE cl430 PATHS "${MSP430_TOOLCHAIN_ROOT}" NO_DEFAULT_PATH)

#hex430 converts output file to hex file
find_program(CG_TOOL_HEX hex430 PATHS "${MSP430_TOOLCHAIN_ROOT}" NO_DEFAULT_PATH)


set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR MSP430X)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
