import api/main
import cligen

proc krtrld() =
    ## The krtrl daemon
    apiInit()

when isMainModule:
    dispatch krtrld
