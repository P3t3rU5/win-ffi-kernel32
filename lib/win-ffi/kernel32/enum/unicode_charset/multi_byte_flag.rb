module WinFFI
  module Kernel32
    MultiByteFlag = enum :multi_byte_flag, [
        :PRECOMPOSED,       0x00000001,
        :COMPOSITE,         0x00000002,
        :USEGLYPHCHARS,     0x00000004,
        :ERR_INVALID_CHARS, 0x00000008
    ]

    define_prefix(:MB, MultiByteFlag)
  end
end