# Package

version       = "0.1.0"
author        = "Dominik Picheta"
description   = "A client for the Pwned passwords API."
license       = "MIT"
srcDir        = "src"
bin           = @["pwned"]

skipExt = @["nim"]

# Dependencies

requires "nim >= 0.17.3"
