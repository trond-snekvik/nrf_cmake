
# Versions
set(SOFTDEVICES_nrf51
    "nosd"
    "s110_nrf51822_5.2.1"
    "s110_nrf51822_6.2.1"
    "s110_nrf51822_7.3.0"
    "s110_nrf51_8.0.0"
    "s120_nrf51_2.1.0"
    "s120_nrf51822_1.0.1"
    "s130_nrf51822_1.0.1"
    "s130_nrf51_2.0.1")

set(SOFTDEVICES_nrf52810
    "nosd"
    "s112_nrf52_6.1.0"
    "s132_nrf52_1.0.0-3.alpha"
    "s132_nrf52_2.0.1"
    "s132_nrf52_3.1.0"
    "s132_nrf52_4.0.5"
    "s132_nrf52_5.1.0"
    "s132_nrf52_6.1.0"
    )

set(SOFTDEVICES_nrf52832
    "nosd"
    "s112_nrf52_6.1.0"
    "s132_nrf52_1.0.0-3.alpha"
    "s132_nrf52_2.0.1"
    "s132_nrf52_3.1.0"
    "s132_nrf52_4.0.5"
    "s132_nrf52_5.1.0"
    "s132_nrf52_6.1.0")

set(SOFTDEVICES_nrf52840
    "nosd"
    "s112_nrf52_6.1.0"
    "s132_nrf52_1.0.0-3.alpha"
    "s132_nrf52_2.0.1"
    "s132_nrf52_3.1.0"
    "s132_nrf52_4.0.5"
    "s132_nrf52_5.1.0"
    "s132_nrf52_6.1.0"
    "s140_nrf52_6.1.0")

# Flash requirements
math(EXPR SOFTDEVICE_FLASH_SIZE_nosd                        "0")
math(EXPR SOFTDEVICE_FLASH_SIZE_s110_nrf51822_5.2.1         "80 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s110_nrf51822_6.2.1         "80 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s110_nrf51822_7.3.0         "88 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s110_nrf51_8.0.0            "96 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s120_nrf51822_1.0.1         "96 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s120_nrf51_2.1.0            "116 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s130_nrf51822_1.0.1         "112 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s130_nrf51_2.0.1            "108 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s112_nrf52_6.1.0            "100 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s132_nrf52_1.0.0-3.alpha    "124 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s132_nrf52_2.0.1            "112 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s132_nrf52_3.1.0            "124 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s132_nrf52_4.0.5            "124 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s132_nrf52_5.1.0            "140 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s132_nrf52_6.1.0            "152 * 1024")
math(EXPR SOFTDEVICE_FLASH_SIZE_s140_nrf52_6.1.0            "152 * 1024")

# RAM requirements (minimum)
math(EXPR SOFTDEVICE_RAM_SIZE_nosd                          "0")
math(EXPR SOFTDEVICE_RAM_SIZE_s110_nrf51822_5.2.1           "8 * 1024")
math(EXPR SOFTDEVICE_RAM_SIZE_s110_nrf51822_6.2.1           "8 * 1024")
math(EXPR SOFTDEVICE_RAM_SIZE_s110_nrf51822_7.3.0           "8 * 1024")
math(EXPR SOFTDEVICE_RAM_SIZE_s110_nrf51_8.0.0              "6616")
math(EXPR SOFTDEVICE_RAM_SIZE_s120_nrf51822_1.0.1           "10 * 1024")
math(EXPR SOFTDEVICE_RAM_SIZE_s120_nrf51_2.1.0              "10 * 1024")
math(EXPR SOFTDEVICE_RAM_SIZE_s130_nrf51822_1.0.1           "8916")
math(EXPR SOFTDEVICE_RAM_SIZE_s130_nrf51_2.0.1              "5064")
math(EXPR SOFTDEVICE_RAM_SIZE_s112_nrf52_6.1.0              "3952")
math(EXPR SOFTDEVICE_RAM_SIZE_s132_nrf52_1.0.0-3.alpha      "10 * 1024")
math(EXPR SOFTDEVICE_RAM_SIZE_s132_nrf52_2.0.1              "5064")
math(EXPR SOFTDEVICE_RAM_SIZE_s132_nrf52_3.1.0              "6592")
math(EXPR SOFTDEVICE_RAM_SIZE_s132_nrf52_4.0.5              "5056")
math(EXPR SOFTDEVICE_RAM_SIZE_s132_nrf52_5.1.0              "4992")
math(EXPR SOFTDEVICE_RAM_SIZE_s132_nrf52_6.1.0              "5672")
math(EXPR SOFTDEVICE_RAM_SIZE_s140_nrf52_6.1.0              "5672")
