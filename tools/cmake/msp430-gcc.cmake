

if (NOT DEFINED ENV{MSP430_GCC_INSTALL})
	message(FATAL_ERROR "MSP430_GCC_INSTALL environment variable is not defined!")
else()
	message(STATUS "MSP430_GCC_INSTALL equals: $ENV{MSP430_GCC_INSTALL}")
endif()

find_program(CMAKE_ASM_COMPILER msp430-elf-gcc PATHS "$ENV{MSP430_GCC_INSTALL}/bin" NO_DEFAULT_PATH)
find_program(CMAKE_C_COMPILER msp430-elf-gcc PATHS "$ENV{MSP430_GCC_INSTALL}/bin" NO_DEFAULT_PATH)
find_program(CMAKE_CXX_COMPILER msp430-elf-g++ PATHS "$ENV{MSP430_GCC_INSTALL}/bin" NO_DEFAULT_PATH)
find_program(CMAKE_OBJCOPY msp430-elf-objcopy PATHS "$ENV{MSP430_GCC_INSTALL}/bin" NO_DEFAULT_PATH)
find_program(CMAKE_SIZE_UTIL msp430-elf-size PATHS "$ENV{MSP430_GCC_INSTALL}/bin" NO_DEFAULT_PATH)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR MSP430X)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
