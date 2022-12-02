import asyncdispatch, jester, os, strutils, times

echo "lol"

router myrouter:
  get "/":
    resp "Generated in nim " & $now()

proc main() =
  let port = Port(5000)
  let settings = newSettings(port=port)
  var jester = initJester(myrouter, settings=settings)
  jester.serve()

when isMainModule:
  main()