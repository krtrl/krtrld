import json
import jester
import ../common
import strutils

## API Imports

# System API
import ../api/system/info
import ../api/system/portForward

# Service API
import ../api/services/info
import ../api/services/logs

# Package API
import ../api/packages/info

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

        get "/api/v1/packages/@name/info":
            resp getPackageInfo(@"name")

        # Container API

        get "/api/v1/containers/@name/info":
            resp "TBD"
            #resp getContainerInfo(@"name")

        get "/api/v1/containers/list":
            resp "TBD"
            #resp getContainerList()

        # Service API

        get "/api/v1/services/@name/info":
            resp getServiceInfo(@"name")

        get "/api/v1/services/list":
            resp "TBD"
            #resp getServiceList()
        
        get "/api/v1/services/@name/logs":
            resp getServiceLogs(@"name")
        
        # System API
        get "/api/v1/system/info":
            resp getSysInfo()

        get "/api/v1/system/ports/list":
            resp "TBD"
            #resp getPorts()

        post "/api/v1/system/ports/forward":
            var parsedReq = parseJson(request.body)
            resp portForward(parseInt($parsedReq["host"]), parseInt($parsedReq["target"]))

        ## runList API

        # runList inventory

        get "/api/v1/runList/inventory":
            resp "TBD"
            #resp getRunListInventory()

        get "/api/v1/runList/inventory/@name/info":
            resp "TBD"
            #resp getRunListInventoryInfo(@"name")

        post "/api/v1/runList/inventory/@name":
            resp "TBD"
            #resp postRunListInventory(@"name")
        
        post "/api/v1/runList/inventory/@name/remove":
            resp "TBD"
            #resp removeRunListInventory(@"name")

        # runList runner

        get "/api/v1/runList":
            resp "TBD"
            #resp getRunLists()

        get "/api/v1/runList/@name":
            resp "TBD"
            #resp getRunList(@"name")

        post "/api/v1/runList/@name/run":
            resp "TBD"
            #resp runRunList(@"name")
        
        post "/api/v1/runList/@name/stop":
            resp "TBD"
            #resp stopRunList(@"name")

        ## Plugin API

        get "/api/v1/plugins/list":
            resp "TBD"
            #resp getPlugins()

        get "/api/v1/plugins/@name/info":
            resp "TBD"
            #resp getPluginInfo(@"name")

        post "/api/v1/plugins/@name/enable":
            resp "TBD"
            #resp enablePlugin(@"name")

        post "/api/v1/plugins/@name/disable":
            resp "TBD"
            #resp disablePlugin(@"name")
