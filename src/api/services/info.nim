import os, json
import strutils
import ../../backends/wrapper/init

proc getServiceList*(): JsonNode =
    ## Returns the service list.
    return init.getServiceList()

proc getServiceInfo*(name: string): JsonNode =
    ## Gets the service information
    let serviceStatus = getServiceStatus(name)
    if not isEmptyOrWhitespace(serviceStatus.error):
        return %*{
            "loadError": serviceStatus.error
        }
    else:
        return %*{
            "name": name,
            "status": serviceStatus.output,
            "pid": getServicePid(name),
            "description": getServiceDescription(name)
        } 

