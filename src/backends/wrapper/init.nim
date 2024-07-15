import json

when hostOS == "linux":
    import ../linux/init
when hostOS == "windows":
    import ../windows/init
when hostOS == "darwin":
    import ../darwin/init

proc getServiceList*(serviceType = "all", loaded = "all", status = "all"): JsonNode =
    when hostOS == "linux":
        return getServiceListSystemd()
    else:
        return init.getServiceList()

proc getServiceStatus*(name: string): tuple[output: string, error: string] =
    when hostOS == "linux":
        return getServiceStatusSystemd(name)
    else:
        return init.getServiceStatus(name)

proc getServicePid*(name: string): int =
    when hostOS == "linux":
        return getServicePidSystemd(name)
    else:
        return init.getServicePid(name)

proc getServiceDescription*(name: string): string =
    when hostOS == "linux":
        return getServiceDescriptionSystemd(name)
    else:
        return init.getServiceDescription(name)

proc getServiceLogs*(name: string): tuple[output: string, exitCode: int]=
    when hostOS == "linux":
        return getServiceLogsSystemd(name)
    else:
        return init.getServiceLogs(name)
