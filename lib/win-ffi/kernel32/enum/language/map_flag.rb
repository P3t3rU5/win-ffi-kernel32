module WinFFI
  module Kernel32
    # Locale Independent Mapping Flags.
    MapFlag = enum :map_flag, [
        :FOLDCZONE,        0x00000010,
        :PRECOMPOSED,      0x00000020,
        :COMPOSITE,        0x00000040,
        :FOLDDIGITS,       0x00000080,
        :EXPAND_LIGATURES, 0x00002000
    ]

    define_prefix(:MAP, MapFlag)
  end
end