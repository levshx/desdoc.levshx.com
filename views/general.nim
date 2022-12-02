#? stdtmpl(subsChar = '$', metaChar = '#')
#import xmltree
#
#proc `$!`(text: string): string = escape(text)
#end proc
#
#proc renderMain*(body: string): string =
#  result = ""
<!DOCTYPE html>
<html>
  <head>
    <title>Tweeter written in Nim</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>

  <body>
    ${body}
  </body>

</html>
#end proc