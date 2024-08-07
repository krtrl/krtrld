import json
import osproc
import strutils


proc runCmd*(cmd: string, daemon = false): JsonNode =

    var options = {poUsePath, poEvalCommand}

    if daemon:
        options = options + {poDaemon}
        let p = startProcess(cmd, options = options)
        return %*{
            "command": cmd,
            "PID": processID(p)
        }  
   
    let o = execCmdEx(cmd, options = options)
    return %*{
        "command": cmd,
        "output": o.output,
        "exitCode": o.exitCode
    }
