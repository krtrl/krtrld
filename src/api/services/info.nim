import os, json
import ../../backends/wrapper/init

proc getServiceInfo*(name: string): JsonNode =
    ## Gets the service information
    %*{
        "name": name,
        "status": getServiceStatus(name),
        "pid": getServicePid(name),
      } 

