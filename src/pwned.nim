import securehash, httpclient, strutils, strformat

const
  apiUrl = "https://api.pwnedpasswords.com/range/"

proc rangeCheck(hash: SecureHash): int =
  ## Takes a SHA1 hash and returns the corresponding password's occurrences
  ## in the Pwned Passwords database.
  result = 0

  let prefix = ($hash)[0..<5]
  let suffix = ($hash)[5..^1]

  let client = newHttpClient()
  let response = client.get(apiUrl & prefix)
  if response.code == Http200:
    for line in response.body.splitLines():
      let parts = line.split(":")
      assert parts.len == 2

      if suffix == parts[0]:
        return parts[1].parseInt()

when isMainModule:
  stdout.write("Please enter your password: ")
  let password = stdin.readLine()

  let hash = secureHash(password)
  let occurrences = rangeCheck(hash)
  echo(fmt"Your password was found to be used {occurrences} times")
