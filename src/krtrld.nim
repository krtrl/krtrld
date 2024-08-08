import api/main
import cligen

proc krtrld(port = 7331) =
    ## The krtrl daemon
    apiInit(port=port)

when isMainModule:
    dispatch krtrld
