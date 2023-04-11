
# MSP430_CCS_INSTALL should point to C:\ti\ccs1210\ccs\tools\compiler\ti-cgt-msp430_21.6.1.LTS, or something simillar depending on install location and version

if (NOT DEFINED ENV{MSP430_CCS_INSTALL})
	message(FATAL_ERROR "MSP430_CCS_INSTALL environment variable is not defined!")
else()
	message(STATUS "MSP430_CCS_INSTALL equals: $ENV{MSP430_CCS_INSTALL}")
endif()

set(MSP430_TOOLCHAIN_ROOT "$ENV{MSP430_CCS_INSTALL}/tools/compiler/ti-cgt-msp430_21.6.1.LTS")

#cl430 is the cmd line tool that invokes either the asm, c/c++ compiler, or linker depending on flags
find_program(CMAKE_ASM_COMPILER cl430 PATHS "${MSP430_TOOLCHAIN_ROOT}/bin" NO_DEFAULT_PATH)
find_program(CMAKE_C_COMPILER cl430 PATHS "${MSP430_TOOLCHAIN_ROOT}/bin" NO_DEFAULT_PATH)
find_program(CMAKE_CXX_COMPILER cl430 PATHS "${MSP430_TOOLCHAIN_ROOT}/bin" NO_DEFAULT_PATH)
find_program(CMAKE_C_LINK_EXECUTABLE cl430 PATHS "${MSP430_TOOLCHAIN_ROOT}/bin" NO_DEFAULT_PATH)

#hex430 converts output file to hex file
find_program(CG_TOOL_HEX hex430 PATHS "${MSP430_TOOLCHAIN_ROOT}/bin" NO_DEFAULT_PATH)


set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR MSP430X)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
