import asyncdispatch, jester, os, strutils

router myrouter:
  get "/":
    resp "Hello! from nim"

proc main() =
  let port = Port(80)
  let settings = newSettings(port=port)
  var jester = initJester(myrouter, settings=settings)
  jester.serve()

when isMainModule:
  main()