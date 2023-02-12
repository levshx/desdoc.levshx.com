when (compiles do: import karax / karaxdsl):
  import karax / [karaxdsl, vdom]
else:
  {.error: "Please use `logue extension karax` to install!".}

import prologue

import
  share/head,
  share/nav,
  share/footer


proc loginSection*(ctx: Context, title: string, error: string = ""): VNode =
  result = buildHtml(main(class = "content")):
    h3: text title
    if error.len > 0:
      tdiv(class = "alert"):
        text error
    form(`method` = "post"):
      label(`for` = "username"): text "Username"
      input(name = "username", id = "username", required = "required")
      label(`for` = "password"): text "Password"
      input(`type` = "password", name = "password", id = "password",
              required = "required")
      input(`type` = "submit", value = "Login")


proc loginPage*(ctx: Context, title: string, error: string = ""): string =
  let head = sharedHead(ctx, title)
  let nav = sharedNav(ctx)
  let login = loginSection(ctx, title, error)
  let foot = sharedFooter(ctx)
  let vNode = buildHtml(html):
    head
    nav
    login
    foot

  result = "<!DOCTYPE html>\n" & $vNode
