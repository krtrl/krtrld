import std/osproc
import std/strutils

proc getServiceStatusSystemd*(service: string): string =
    ## Gets service status.
    let serviceStat = execCmdEx("systemctl show --no-pager "&service).output
    for stat in serviceStat.split("\n"):
        let statSplit = stat.split("=")

        if statSplit[0] == "SubState":
            return statSplit[1]

proc getServicePidSystemd*(service: string): int =
    ## Gets service PID.
    let serviceStat = execCmdEx("systemctl show --no-pager "&service).output
    for stat in serviceStat.split("\n"):
        let statSplit = stat.split("=")

        if statSplit[0] == "MainPID":
            return parseInt(statSplit[1])
