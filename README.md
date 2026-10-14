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

```
repo init -u https://github.com/LineageOS-Revived/android.git -b lineage-18.1 --git-lfs
repo sync
. build/envsetup.sh
breakfast j7eltemtr
./device/samsung/j7eltemtr/extract-files.sh /path/to/stock/system
brunch j7eltemtr
```

Proprietary files are extracted from a stock J700T1UVU3BQK3 (or J700TUVU3BQI5) system image.

## Copyright

Copyright (C) 2026 JuanLiz. Based on `android_device_samsung_j7elte` by The LineageOS Project.
Licensed under the Apache License, Version 2.0.
