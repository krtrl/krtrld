when hostOS == "linux":
    import ../linux/main
elif hostOS == "windows":
    import ../windows/main
elif hostOS == "darwin":
    import ../darwin/main

proc getDistroName*(): tuple[id: string, prettyName: string] =
    return main.getDistroName()

proc getHostname*(): string =
    return main.getHostname()

proc getInit*(): string =
    return main.getInit()

proc getMemory*(): string =
    return main.getMemory()
