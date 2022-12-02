#? stdtmpl(subsChar = '$', metaChar = '#')
#import xmltree
#
#proc `$!`(text: string): string = escape(text)
#end proc
#
#proc hello*(username: string): string =
#  result = ""
<div id="user">
  <h1>${$!username} hello!</h1>
</div>
#end proc