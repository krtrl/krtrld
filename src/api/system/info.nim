import os, json, cpuinfo
when hostOS == "linux":
    import ../../backends/linux/main
    import ../../backends/linux/distro
#when hostOS == "windows":
#    import ../../backends/windows/main
#when hostOS == "freebsd":
#    import ../../backends/freebsd/main
#when hostOS == "darwin":
#    import ../../backends/darwin/main

proc getSysInfo*(): JsonNode =
    ## Gets systemInfo.
    %*{
        "system": {
            "hostname": getHostname(),
            "os": getDistroName().id,
            "osPrettyName": getDistroName().prettyName,
            "packageManager": getPackageManager(),
            "initSystem": getInit(),
            "platform": hostOS,
            "arch": hostCPU,
            "cpus": countProcessors(),
            "memory": getMemory(),
            "disks": {
                "tbd": "tbd"
            }
        }
    }

