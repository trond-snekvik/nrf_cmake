# nRF CMake

Simple CMake project setup for Nordic Semiconductor devices and
[ARM GCC](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads).

This project is not maintained or supported by Nordic Semiconductor ASA.

See the example directory for an example of how a project can be set up.

## Prerequisites

Requires the nRF5 SDK available at http://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/.
Create an environmental variable named `SDK_ROOT`, and point it at the root directory of your
copy of the nRF5 SDK, or pass the directory to CMake when generating build files:
`-DSDK_ROOT=<SDK-path>`

### Tools:

- [CMake version 3.6 or newer](https://cmake.org/download/)
- [ARM GCC 5.3 or newer](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads) (**NOTE:** 8-2018-q4-major is [broken on Windows](https://bugs.launchpad.net/gcc-arm-embedded/+bug/1810274))
- [nRF5 Command line tools](https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF5-Command-Line-Tools) for flashing the applications.
- On Windows: [Ninja build](https://ninja-build.org/)

## Building

To build a project, enter the project's top level directory and create a `build` folder.

Enter the `build` folder and call CMake:
```
cmake -G <generator> ..
```

to generate build files. On Linux, the generator argument can be skipped. This makes CMake generate
GNU Makefiles. On Windows, [Ninja](https://ninja-build.org/) provides the most reliable results,
but depending on your environment, "MinGW Makefiles" should work as well.

Note that you only have to generate your build files once.

After CMake has generated the build files, you can build your project:
```
cmake --build .
```

You can see a list of available targets by calling
```
cmake --build . --target help
```
and build specific targets with

```
cmake --build . --target <target-name>
```

It's also possible to build using your chosen generator directly. Just call `make`, `ninja`, or
whatever other generator you've chosen.

Both .elf and .hex files are generated for each application. The application files are named
in a `<NAME>_<DEVICE>_<CHIP_CONFIG>_<SOFTDEVICE>.elf` scheme. Example: `my_app_nrf52832_xxaa_s132_nrf52_6.1.0.elf`

### Configuration

You can select chip version, Softdevice version and other configuration variables by passing them to CMake:
```
cmake -Dvar=value .
```

Available configuration variables:

| Variable      | Values                                                               | Default    | Example                         |
|---------------|----------------------------------------------------------------------|------------|---------------------------------|
| DEVICE        | `nrf51`, `nrf52832`, `nrf52840`, `nrf52810`                          | `nrf52832` | `-DDEVICE=nrf52832`             |
| CHIP_CONFIG   | Depends on the chosen device, e.g. `xxaa`, `xxab`                    | `xxaa`     | `-DCHIP_CONFIG=xxab`            |
| SOFTDEVICE    | Depends on the chosen device, e.g. `nosd`, `s132_nrf52_6.1.0`        | `nosd`     | `-DSOFTDEVICE=s132_nrf52_6.1.0` |
| RAM_OFFSET    | Offset of application RAM start from the base Softdevice RAM offset. | `0`        | `-DRAM_OFFSET=1024`             |

### Example

To illustrate, here's how to build the example project in the `example` directory on Windows with
`Ninja`, assuming that you have added SDK_ROOT to your environment variables:

```
cd example
mkdir build
cd build
cmake -G Ninja ..
ninja
```

## Flashing

After building your applications, you can flash them with `nrfjprog` from the
[nRF5 Command line tools](https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF5-Command-Line-Tools).

To flash an application *without* a Softdevice, call

```
nrfjprog --program <application>.hex --chiperase --reset
```

If you specified a Softdevice in the build configuration step, you'll need to first flash the
Softdevice hexfile, then the application:

```
nrfjprog --program <softdevice>.hex --chiperase
nrfjprog --program <application>.hex --reset
```
