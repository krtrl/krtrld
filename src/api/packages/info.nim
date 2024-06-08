import os, json
when hostOS == "linux":
    import ../../backends/linux/init
#when hostOS == "windows":
#    import ../../backends/windows/main
#when hostOS == "freebsd":
#    import ../../backends/freebsd/main
#when hostOS == "darwin":
#    import ../../backends/darwin/main

proc getServiceInfo*(name: string): JsonNode =
    ## Gets the service information
    %*{
        "name": name,
        "status": "running",
        "pid": 1234,
      } 

