import std/distros
import std/strutils

proc getPackageManager*(): string =
    ## Gets the package manager of the host.
    return "dnf"
