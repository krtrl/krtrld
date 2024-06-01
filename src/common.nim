import std/[parsecfg, streams]

const daemonName* = "krtrld"
const version* = staticRead("../"&daemonName&".nimble").newStringStream.loadConfig.getSectionValue("", "version")

