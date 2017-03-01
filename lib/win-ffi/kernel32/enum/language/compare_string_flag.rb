require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    buffer = [
        :LINGUISTIC_IGNORECASE,      0x00000010,
        :LINGUISTIC_IGNOREDIACRITIC, 0x00000020,

        :NORM_IGNORECASE,            0x00000001,
        :NORM_IGNORENONSPACE,        0x00000002,
        :NORM_IGNORESYMBOLS,         0x00000004,

        :NORM_IGNOREKANATYPE,        0x00010000,
        :NORM_IGNOREWIDTH,           0x00020000,
        :NORM_LINGUISTIC_CASING,     0x08000000,

        :SORT_STRINGSORT,            0x00001000,
    ]

    buffer += [:SORT_DIGITSASNUMBERS,  0x00000008] if WINDOWS_VERSION >= 7

    CompareStringFlag = enum :compare_string_flag, buffer
  end
end