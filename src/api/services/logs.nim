import os, json
import strutils
import ../../backends/wrapper/init

proc getServiceLogs*(name: string): JsonNode =
    ## Gets the service logs for the given service name.
    return %*{
            "logs": init.getServiceLogs(name).output
    }
