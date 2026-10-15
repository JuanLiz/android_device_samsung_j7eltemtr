# Device tree for Samsung Galaxy J7 2015 T-Mobile / MetroPCS (j7eltemtr)

The Samsung Galaxy J7 2015 for T-Mobile (SM-J700T) and MetroPCS (SM-J700T1) is a mid-range
smartphone from Samsung released in 2015.

<img width="720" height="720" alt="image" src="https://github.com/user-attachments/assets/d587c933-0616-452f-a004-f61ab4cb8b8b" />


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

 ## Proprietary files

  Both `extract-files.sh` scripts read a mounted system image of the stock firmware
  J700T1UVU3BQK3 (SM-J700T1) or J700TUVU3BQI5 (SM-J700T) and populate
  `vendor/samsung/j7eltemtr` and `vendor/samsung/universal7580-common`. A few files need
  extra handling:

  - **`vendor/bin/cbd` and `vendor/bin/sswap`** (modem boot daemon and swap helper) are not
    in the system image but in the stock boot ramdisk. Unpack `boot.img` from the same
    firmware and copy `sbin/cbd` and `sbin/sswap` into
    `vendor/samsung/j7eltemtr/proprietary/vendor/bin/`.
  - **`lib/libsec-ril.so`, `vendor/etc/plmn_delta.bin` and `vendor/etc/plmn_se13.bin`** are
    pinned to the versions in
    [TheMuppets' `j7elte` tree](https://github.com/TheMuppets/proprietary_vendor_samsung/tree/lineage-18.1/j7elte/proprietary):
    the RIL is the Galaxy A3 2016 build with the gpsd path fixed, and the PLMN database is
    newer than the one shipped with this firmware. The extractor reports them as a hash
    mismatch; replace them with the pinned copies.
  - **`lib/libaptX_encoder.so` and `lib/libprotobuf-cpp-fl26.so`** are not part of any
    J7 2015 firmware. The common tree pins them to the versions in
    [TheMuppets' `universal7580-common` tree](https://github.com/TheMuppets/proprietary_vendor_samsung/tree/lineage-18.1/universal7580-common/proprietary)
    (aptX encoder from the Pixel, and a protobuf library built for the Exynos 7580 gpsd).
    Copy them into `vendor/samsung/universal7580-common/proprietary/lib/`.

  The vendor trees are not published; build them locally as described above.

## Copyright

  Copyright © 2026 JuanLiz. Based on `android_device_samsung_j7elte` by The LineageOS Project.

  Licensed under the Apache License, Version 2.0; see [LICENSE](LICENSE).
