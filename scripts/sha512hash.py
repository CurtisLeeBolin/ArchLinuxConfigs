#!/usr/bin/env python3

import crypt

print(
  crypt.crypt(
    input(),
    crypt.mksalt(
      crypt.METHOD_SHA512
    )
  )
)
