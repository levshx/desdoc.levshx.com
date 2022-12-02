import asyncdispatch, jester

import views/hello, views/general


router routings:
  get "/":
    resp renderMain(hello("levshx"))

proc main() =
  let port = Port(5000)
  let settings = newSettings(port=port)
  var jester = initJester(routings, settings=settings)
  jester.serve()

when isMainModule:
  main()