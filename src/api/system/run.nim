import json
import osproc

proc runCmd*(cmd: string): JsonNode =
    let o = execCmdEx(cmd)
    return %*{
        "command": cmd,
        "output": o.output,
        "exitCode": o.exitCode
    }
