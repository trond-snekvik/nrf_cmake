set(PWD ${CMAKE_CURRENT_LIST_DIR})

include("${PWD}/device.cmake")
include("${PWD}/softdevice.cmake")

# Find SDK
find_path(SDK_ROOT
    "components/sdk_validation.h"
    HINTS
        "../nRF5_SDK_15.0.0_a53641a"
        "../../nRF5_SDK_15.0.0_a53641a"
        "../nRF5_SDK_15.2.0_9412b96"
        "../../nRF5_SDK_15.2.0_9412b96"
        ENV "SDK_ROOT" "SDK15_ROOT"
    PATH_SUFFIXES "components" "modules/nrfx"
    DOC "nRF5 SDK Directory")

if (EXISTS ${SDK_ROOT})
    message(STATUS "SDK_ROOT: ${SDK_ROOT}")
else()
    message(FATAL_ERROR
            "nRF5 SDK 15 not found. Download it from http://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x "
            "and pass it to CMake with -DSDK_ROOT=<SDK dir> or add the environment variable SDK_ROOT=<SDK dir>.\n")
endif()

# Derived paths
set(NRFX_ROOT "${SDK_ROOT}/modules/nrfx")
set(MDK_ROOT "${SDK_ROOT}/modules/nrfx/mdk")

# Configuration options
set(DEVICE "nrf52832" CACHE STRING "Device to compile for")
set(CHIP_CONFIG "xxaa" CACHE STRING "Chip configuration to compile for")
set(SOFTDEVICE "nosd" CACHE STRING "Softdevice to build for")
set(RAM_OFFSET "0" CACHE STRING "Additional RAM start offset")

set_property(CACHE DEVICE PROPERTY STRINGS ${DEVICES})
set_property(CACHE CHIP_CONFIG PROPERTY STRINGS ${CHIP_CONFIGS_${DEVICE}})
set_property(CACHE SOFTDEVICE PROPERTY STRINGS ${SOFTDEVICES_${DEVICE}})


set(CONFIGURATION ${DEVICE}_${CHIP_CONFIG}_${SOFTDEVICE})
set(LINKER_SCRIPT ${CMAKE_CURRENT_BINARY_DIR}/${CONFIGURATION}.ld)

# Create linker script
math(EXPR FLASH_START "${FLASH_START_${DEVICE}_${CHIP_CONFIG}} + ${SOFTDEVICE_FLASH_SIZE_${SOFTDEVICE}}")
math(EXPR FLASH_SIZE "${FLASH_SIZE_${DEVICE}_${CHIP_CONFIG}} - ${FLASH_START}")
math(EXPR RAM_START "${RAM_START_${DEVICE}_${CHIP_CONFIG}} + ${SOFTDEVICE_RAM_SIZE_${SOFTDEVICE}} + ${RAM_OFFSET}")
math(EXPR RAM_SIZE "${RAM_SIZE_${DEVICE}_${CHIP_CONFIG}} - (${SOFTDEVICE_RAM_SIZE_${SOFTDEVICE}} + ${RAM_OFFSET})")

configure_file(${PWD}/toolchain/linker.ld.in ${LINKER_SCRIPT})

# Setup toolchain

set(CMAKE_TOOLCHAIN_FILE "${PWD}/toolchain/gcc.cmake")

include_directories(
    "${SDK_ROOT}/components/toolchain/cmsis/include"
    "${SDK_ROOT}/components/libraries"
    "${MDK_ROOT}")
link_libraries("-T${LINKER_SCRIPT}")

# Overwrite add_executable to create hex-file, map-file and include system-sources
function(add_executable name)
    set(CMAKE_EXECUTABLE_SUFFIX _${CONFIGURATION}.elf PARENT_SCOPE)

    _add_executable(${name}
        ${ARGN}
        "${PWD}/toolchain/gcc_startup_${DEVICE}.S"
        "${SDK_ROOT}/modules/nrfx/mdk/${SYSTEM_FILE_${DEVICE}}")

    target_link_libraries(${name} "-Xlinker -Map=${CMAKE_CURRENT_BINARY_DIR}/${name}.map")

    add_custom_command(
        TARGET ${name}
        POST_BUILD
        COMMAND arm-none-eabi-size ${CMAKE_CURRENT_BINARY_DIR}/${name}_${CONFIGURATION}.elf
        )

    add_custom_command(
        TARGET ${name}
        POST_BUILD
        COMMAND arm-none-eabi-objcopy -O ihex ${CMAKE_CURRENT_BINARY_DIR}/${name}_${CONFIGURATION}.elf ${CMAKE_CURRENT_BINARY_DIR}/${name}_${CONFIGURATION}.hex
        )
endfunction(add_executable)
