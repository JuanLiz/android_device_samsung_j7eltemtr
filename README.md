# Device tree for Samsung Galaxy J7 2015 T-Mobile / MetroPCS (j7eltemtr)

The Samsung Galaxy J7 2015 for T-Mobile (SM-J700T) and MetroPCS (SM-J700T1) is a mid-range
smartphone from Samsung released in 2015.

## Device specifications

| Feature                 | Specification                                                      |
| :---------------------- | :----------------------------------------------------------------- |
| Chipset                 | Samsung Exynos 7580 (28 nm)                                        |
| CPU                     | Octa-core 1.5 GHz Cortex-A53                                       |
| GPU                     | Mali-T720MP2                                                       |
| Memory                  | 1.5 GB                                                             |
| Shipped Android version | 5.1.1, last official 7.1.1                                         |
| Storage                 | 16 GB eMMC, microSD                                                |
| Battery                 | Li-Ion 3000 mAh, removable                                         |
| Display                 | 5.5", 720 x 1280, Super AMOLED                                     |
| Rear camera             | 13 MP, f/1.9, autofocus, LED flash                                 |
| Front camera            | 5 MP, f/2.2, LED flash                                             |
| Connectivity            | Wi-Fi 802.11 b/g/n, Bluetooth 4.1, NFC, GPS                        |
| Sensors                 | Accelerometer, proximity, grip                                     |
| Kernel                  | Linux 3.10                                                         |

## Build

Based on LineageOS-Revived 18.1.

`.repo/local_manifests/j7eltemtr.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project path="device/samsung/j7eltemtr" name="JuanLiz/android_device_samsung_j7eltemtr" remote="github" revision="lineage-18.1" />
  <project path="device/samsung/universal7580-common" name="JuanLiz/android_device_samsung_universal7580-common" remote="github" revision="lineage-18.1" />
  <project path="kernel/samsung/universal7580" name="JuanLiz/android_kernel_samsung_universal7580" remote="github" revision="lineage-18.1" />
  <project path="hardware/samsung" name="LineageOS/android_hardware_samsung" remote="github" revision="lineage-18.1" />
  <project path="hardware/samsung/nfc" name="LineageOS/android_hardware_samsung_nfc" remote="github" revision="lineage-18.1" />
  <project path="hardware/samsung_slsi/exynos" name="LineageOS/android_hardware_samsung_slsi_exynos" remote="github" revision="lineage-18.1" />
  <project path="hardware/samsung_slsi/exynos5" name="LineageOS/android_hardware_samsung_slsi_exynos5" remote="github" revision="lineage-18.1" />
  <project path="hardware/samsung_slsi/exynos7580" name="LineageOS/android_hardware_samsung_slsi_exynos7580" remote="github" revision="lineage-18.1" />
  <project path="hardware/samsung_slsi/openmax" name="LineageOS/android_hardware_samsung_slsi_openmax" remote="github" revision="lineage-18.1" />
</manifest>
```

```
repo init -u https://github.com/LineageOS-Revived/android.git -b lineage-18.1 --git-lfs
repo sync
. build/envsetup.sh
breakfast j7eltemtr
./device/samsung/j7eltemtr/extract-files.sh /path/to/stock/system
./device/samsung/universal7580-common/extract-files.sh /path/to/stock/system
brunch j7eltemtr
```

Proprietary files are extracted from a stock J700T1UVU3BQK3 (or J700TUVU3BQI5) system image. `cbd` and
`sswap` come from the stock boot ramdisk. `libsec-ril.so` and the PLMN database are pinned to the
versions in TheMuppets' `j7elte` tree; `libaptX_encoder.so` and `libprotobuf-cpp-fl26.so` to the ones
in TheMuppets' `universal7580-common` tree.

## Copyright

Copyright (C) 2026 JuanLiz. Based on `android_device_samsung_j7elte` by The LineageOS Project.
Licensed under the Apache License, Version 2.0.
