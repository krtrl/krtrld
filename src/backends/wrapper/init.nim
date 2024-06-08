when hostOS == "linux":
    import ../linux/init
when hostOS == "windows":
    import ../windows/init
when hostOS == "darwin":
    import ../darwin/init

proc getServiceStatus*(name: string): string =
    when hostOS == "linux":
        return getServiceStatusSystemd(name)
    else:
        return init.getServiceStatus(name)

proc getServicePid*(name: string): int =
    when hostOS == "linux":
        return getServicePidSystemd(name)
    else:
        return init.getServicePid(name)
