require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Character Type Flags
    CharacterType = enum :character_type, [
        :CTYPE1, 0x00000001,
        :CTYPE2, 0x00000002,
        :CTYPE3, 0x00000004,
    ]

    define_prefix(:CT, CharacterType)
  end
end