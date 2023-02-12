import karax / [karaxdsl, vdom]
import prologue

import
  share/head,
  share/nav,
  share/footer


proc registerSection*(ctx: Context, error: string = ""): VNode =
  result = buildHtml(main(class = "content")):
    h3: text "Register"
    if error.len > 0:
      tdiv(class = "alert"):
        text error
    form(`method` = "post"):
      label(`for` = "fullname"): text "Full name"
      input(name = "fullname", id = "fullname", required = "required")
      label(`for` = "username"): text "Username"
      input(name = "username", id = "username", required = "required")
      label(`for` = "password"): text "Password"
      input(`type` = "password", name = "password", id = "password",
          required = "required")
      input(`type` = "submit", value = "Register")


proc registerPage*(ctx: Context, title: string, error: string = ""): string =
  let head = sharedHead(ctx, title)
  let nav = sharedNav(ctx)
  let register = registerSection(ctx, error)
  let foot = sharedFooter(ctx)
  let vNode = buildHtml(html):
    head
    nav
    register
    foot

  result = "<!DOCTYPE html>\n" & $vNode
