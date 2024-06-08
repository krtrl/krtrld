import json
import jester
import ../common
import strutils

## API Imports
import ../api/system/info
import ../api/system/portForward
import ../api/services/info

proc apiInit*() =
    routes:
        get "/api/v1/":
            resp %*{
                    "version": version,
                    "daemon": daemonName
                   }


        # Package API

        get "/api/v1/packages/list":
            resp "TBD"
            #resp getPackageList()

        get "/api/v1/packages/info":
            resp "TBD"
            #resp getPackageInfo(request.params["name"])

        # Container API

        get "/api/v1/containers/info":
            resp "TBD"
            #resp getContainerInfo()

        get "/api/v1/containers/list":
            resp "TBD"
            #resp getContainerList()

        # Service API

        get "/api/v1/services/info":
            resp getServiceInfo(request.params["name"])

        get "/api/v1/services/list":
            resp "TBD"
            #resp getServiceList()
        
        # System API
        get "/api/v1/system/info":
            resp getSysInfo()

        get "/api/v1/system/logs":
            resp "TBD"
            #resp getLogs()

        get "/api/v1/system/ports/list":
            resp "TBD"
            #resp getPorts()

        post "/api/v1/system/ports/forward":
            var parsedReq = parseJson(request.body)
            resp portForward(parseInt($parsedReq["host"]), parseInt($parsedReq["target"]))
