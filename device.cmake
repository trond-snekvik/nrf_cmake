set(DEVICES
    "nrf51"
    "nrf52810"
    "nrf52832"
    "nrf52840")

# Device families

set(FAMILY_nrf51    "NRF51")
set(FAMILY_nrf52810 "NRF52")
set(FAMILY_nrf52832 "NRF52")
set(FAMILY_nrf52840 "NRF52")

# Configurations

set(CHIP_CONFIGS_nrf51
    "xxaa"
    "xxab"
    "xxac")

set(CHIP_CONFIGS_nrf52810
    "xxaa")

set(CHIP_CONFIGS_nrf52832
    "xxaa"
    "xxab")

set(CHIP_CONFIGS_nrf52840
    "xxaa")

# CPU

set(CPU_nrf51       "cortex-m0")
set(CPU_nrf52810    "cortex-m4")
set(CPU_nrf52832    "cortex-m4")
set(CPU_nrf52840    "cortex-m4")

# Systemfile name

set(SYSTEM_FILE_nrf51 "system_nrf51.c")
set(SYSTEM_FILE_nrf52810 "system_nrf52810.c")
set(SYSTEM_FILE_nrf52832 "system_nrf52.c")
set(SYSTEM_FILE_nrf52840 "system_nrf52840.c")

# Compile flags

set(COMPILE_FLAGS_nrf51
    "-mthumb"
    "-mcpu=cortex-m0"
    "-mfloat-abi=soft"
    "-mabi=aapcs"
    "-DNRF51"
    "-DNRF51422")

set(COMPILE_FLAGS_nrf52810
    "-mthumb"
    "-mcpu=cortex-m4"
    "-mfloat-abi=hard"
    "-mfpu=fpv4-sp-d16"
    "-mabi=aapcs"
    "-DNRF52"
    "-DNRF52810")

set(COMPILE_FLAGS_nrf52832
    "-mthumb"
    "-mcpu=cortex-m4"
    "-mfloat-abi=hard"
    "-mfpu=fpv4-sp-d16"
    "-mabi=aapcs"
    "-DNRF52"
    "-DNRF52832")

set(COMPILE_FLAGS_nrf52840
    "-mthumb"
    "-mcpu=cortex-m4"
    "-mfloat-abi=hard"
    "-mfpu=fpv4-sp-d16"
    "-mabi=aapcs"
    "-DNRF52840"
    "-DNRF52840_XXAA")

# Linker flags
set(LINK_FLAGS_COMMON
    "-L${CMAKE_CURRENT_LIST_DIR}/toolchain"
    "-Wl,--gc-sections"
    "--specs=nano.specs"
    "-mthumb"
    "-mabi=aapcs")

set(LINK_FLAGS_nrf51
    ${LINK_FLAGS_COMMON}
    "-mcpu=cortex-m0")

set(LINK_FLAGS_nrf52810
    ${LINK_FLAGS_COMMON}
    "-mcpu=cortex-m4"
    "-mfloat-abi=hard"
    "-mfpu=fpv4-sp-d16")

set(LINK_FLAGS_nrf52832
    ${LINK_FLAGS_COMMON}
    "-mcpu=cortex-m4"
    "-mfloat-abi=hard"
    "-mfpu=fpv4-sp-d16")

set(LINK_FLAGS_nrf52840
    ${LINK_FLAGS_COMMON}
    "-mcpu=cortex-m4"
    "-mfloat-abi=hard"
    "-mfpu=fpv4-sp-d16")

# Chip memory sizes

math(EXPR FLASH_START_COMMON "0")
math(EXPR RAM_START_COMMON "512 * 1024 * 1024")

# nRF51

math(EXPR FLASH_START_nrf51_xxaa    ${FLASH_START_COMMON})
math(EXPR FLASH_SIZE_nrf51_xxaa     "256 * 1024")
math(EXPR RAM_START_nrf51_xxaa      ${RAM_START_COMMON})
math(EXPR RAM_SIZE_nrf51_xxaa       "16 * 1024")

math(EXPR FLASH_START_nrf51_xxab    ${FLASH_START_COMMON})
math(EXPR FLASH_SIZE_nrf51_xxab     "128 * 1024")
math(EXPR RAM_START_nrf51_xxab      ${RAM_START_COMMON})
math(EXPR RAM_SIZE_nrf51_xxab       "16 * 1024")

math(EXPR FLASH_START_nrf51_xxac    ${FLASH_START_COMMON})
math(EXPR FLASH_SIZE_nrf51_xxac     "256 * 1024")
math(EXPR RAM_START_nrf51_xxac      ${RAM_START_COMMON})
math(EXPR RAM_SIZE_nrf51_xxac       "32 * 1024")

# nRF52810

math(EXPR FLASH_START_nrf52810_xxaa    ${FLASH_START_COMMON})
math(EXPR FLASH_SIZE_nrf52810_xxaa     "192 * 1024")
math(EXPR RAM_START_nrf52810_xxaa      ${RAM_START_COMMON})
math(EXPR RAM_SIZE_nrf52810_xxaa       "24 * 1024")

# nRF52832

math(EXPR FLASH_START_nrf52832_xxaa    ${FLASH_START_COMMON})
math(EXPR FLASH_SIZE_nrf52832_xxaa     "512 * 1024")
math(EXPR RAM_START_nrf52832_xxaa      ${RAM_START_COMMON})
math(EXPR RAM_SIZE_nrf52832_xxaa       "64 * 1024")

math(EXPR FLASH_START_nrf52832_xxab    ${FLASH_START_COMMON})
math(EXPR FLASH_SIZE_nrf52832_xxab     "256 * 1024")
math(EXPR RAM_START_nrf52832_xxab      ${RAM_START_COMMON})
math(EXPR RAM_SIZE_nrf52832_xxab       "32 * 1024")

# nRF52840

math(EXPR FLASH_START_nrf52840_xxaa    ${FLASH_START_COMMON})
math(EXPR FLASH_SIZE_nrf52840_xxaa     "1024 * 1024")
math(EXPR RAM_START_nrf52840_xxaa      ${RAM_START_COMMON})
math(EXPR RAM_SIZE_nrf52840_xxaa       "256 * 1024")

# defines

set(C_FLAGS_nrf51
    "NRF51"
    "NRF51422")

set(C_FLAGS_nrf52832
    "NRF52"
    "NRF52832"
    )

set(C_FLAGS_nrf52840
    "NRF52"
    "NRF52840"
    "NRF52840_XXAA"
    )