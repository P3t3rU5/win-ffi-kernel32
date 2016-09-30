require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # CType 1 Flag Bits.
    Ctype1Flag = enum :ctype_1_flag, [
        :UPPER,    0x0001,
        :LOWER,    0x0002,
        :DIGIT,    0x0004,
        :SPACE,    0x0008,
        :PUNCT,    0x0010,
        :CNTRL,    0x0020,
        :BLANK,    0x0040,
        :XDIGIT,   0x0080,
        :ALPHA,    0x0100,
        :DEFINED,  0x0200,
    ]

    define_prefix(:C1, Ctype1Flag)
  end
end