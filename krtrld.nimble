# Package

version       = "0.1.0"
author        = "Kreato"
description   = "The krtrl daemon"
license       = "AGPL-3.0-only"
srcDir        = "src"
bin           = @["krtrld"]


# Dependencies

requires "nim >= 2.0.4"
requires "cligen >= 1.7.0"
requires "jester >= 0.6.0"
