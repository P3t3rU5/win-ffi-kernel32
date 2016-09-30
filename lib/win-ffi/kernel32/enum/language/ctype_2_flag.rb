require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # CType 2 Flag Bits.
    Ctype2Flag = enum :ctype_1_flag, [
        :LEFTTORIGHT,      0x0001,
        :RIGHTTOLEFT,      0x0002,
        :EUROPENUMBER,     0x0003,
        :EUROPESEPARATOR,  0x0004,
        :EUROPETERMINATOR, 0x0005,
        :ARABICNUMBER,     0x0006,
        :COMMONSEPARATOR,  0x0007,
        :BLOCKSEPARATOR,   0x0008,
        :SEGMENTSEPARATOR, 0x0009,
        :WHITESPACE,       0x000A,
        :OTHERNEUTRAL,     0x000B,
        :NOTAPPLICABLE,    0x0000,
    ]

    define_prefix(:C2, Ctype2Flag)
  end
end