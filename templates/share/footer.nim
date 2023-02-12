import prologue
import karax/[karaxdsl, vdom]

import times


proc sharedFooter*(ctx: Context): VNode =  
  let vNode = buildHtml(footer):
    nav:      
      ul:        
        li: span: text "levshx - 2022-" & $now().year & " - All rights reserved."
  return vNode
