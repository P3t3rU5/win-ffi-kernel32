require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # CType 3 Flag Bits.
    Ctype3Flag = enum :ctype_1_flag, [
        :NONSPACING,    0x0001,
        :DIACRITIC,     0x0002,
        :VOWELMARK,     0x0004,
        :SYMBOL,        0x0008,
        :KATAKANA,      0x0010,
        :HIRAGANA,      0x0020,
        :HALFWIDTH,     0x0040,
        :FULLWIDTH,     0x0080,
        :IDEOGRAPH,     0x0100,
        :KASHIDA,       0x0200,
        :LEXICAL,       0x0400,
        :HIGHSURROGATE, 0x0800,
        :LOWSURROGATE,  0x1000,
        :ALPHA,         0x8000,
        :NOTAPPLICABLE, 0x0000,
    ]

    define_prefix(:C3, Ctype3Flag)
  end
end