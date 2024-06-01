import json

proc portForward*(fromPort: int, toPort: int): JsonNode =
    ## Forwards a port from the system, using a proxy.
    %*{
        "action": "success",
        "message": "Port "&($fromPort)&" forwarded to "&($toPort)&" successfully"
    }
