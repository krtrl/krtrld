import parsecfg
import posix_utils
import os
import strutils

proc getDistroName*(): tuple[id: string, prettyName: string] =
    ## Gets the name of the distribution, both in ID and prettyName form.
    let osRelease = loadConfig("/etc/os-release")
    return (osRelease.getSectionValue("", "ID"), osRelease.getSectionValue("", "PRETTY_NAME"))

proc getHostname*(): string =
    ## Returns the hostname.
    return uname().nodename

proc getInit*(): string =
    ## Returns the init system.
    return lastPathPart(expandSymlink("/sbin/init"))

proc getMemory*(): string =
    ## Returns the total memory from /proc/meminfo.
    for l in readFile("/proc/meminfo").splitLines():
        if l.startsWith("MemTotal:"):
            return l.split("MemTotal:")[1].strip()
