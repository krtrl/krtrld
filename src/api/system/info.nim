import json, cpuinfo
import ../../backends/wrapper/main
import ../../backends/linux/distro

proc getSysInfo*(): JsonNode =
    ## Gets systemInfo.

    %*{
        "system": {
            "hostname": getHostname(),
            "os": getDistroName().id,
            "osPrettyName": getDistroName().prettyName,
            "packageManagers": getPackageManager(),
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

