import std/os
import std/sequtils
import std/strutils

proc getPackageManager*(): seq[string] =
    ## Gets the package manager of the host.
    const packageManagers = @[ "apt", "dnf", "yum", "zypper", "pacman", "emerge", "apk", "pkg", "brew", "port", "nix", "kpkg", "swupd" ]

    var packageManagerList: seq[string] = @[]

    for packageManager in packageManagers:
        if fileExists("/usr/bin/" & packageManager) or fileExists("/bin/" & packageManager):
            packageManagerList.add(packageManager)


    return packageManagerList

