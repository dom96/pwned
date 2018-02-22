import terminal, strutils
proc getPassword*(): string =
  result = ""
  var ch = getch()
  while ch notin {'\r', '\3', '\4'}:
    result &= $ch
    ch = getch()

  echo()