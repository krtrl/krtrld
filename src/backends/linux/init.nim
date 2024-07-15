import std/json
import std/osproc
import std/strutils

proc getServiceListSystemd*(): JsonNode =
    ## Gets list of services.
    let serviceList = parseJson(execCmdEx("systemctl list-units --output json").output)
    return serviceList

proc getServiceStatusSystemd*(service: string): tuple[output: string, error: string] =
    ## Gets service status.
    let serviceStat = execCmdEx("systemctl show --no-pager "&service).output
    var output: string
    var error: string

    for stat in serviceStat.split("\n"):
        let statSplit = stat.split("=")

        if statSplit[0] == "SubState":
            output = statSplit[1]
        
        if statSplit[0] == "LoadError":
            error = statSplit[1]

    return (output: output, error: error)

proc getServicePidSystemd*(service: string): int =
    ## Gets service PID.
    let serviceStat = execCmdEx("systemctl show --no-pager "&service).output
    for stat in serviceStat.split("\n"):
        let statSplit = stat.split("=")

        if statSplit[0] == "MainPID":
            return parseInt(statSplit[1])

proc getServiceDescriptionSystemd*(service: string): string =
    ## Gets service description.
    let serviceStat = execCmdEx("systemctl show --no-pager "&service).output
    for stat in serviceStat.split("\n"):
        let statSplit = stat.split("=")

        if statSplit[0] == "Description":
            return statSplit[1]

proc getServiceLogsSystemd*(service: string): tuple[output: string, exitCode: int] =
    ## Gets service logs.
    let res = execCmdEx("journalctl -u "&service)
    return (output: res.output, exitCode: res.exitCode)
