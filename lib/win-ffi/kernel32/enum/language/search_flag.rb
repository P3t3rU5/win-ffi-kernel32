module WinFFI
  module Kernel32
    # Search Flags
    SearchFlag = enum :search_flag, [
        :STARTSWITH, 0x00100000,
        :ENDSWITH,   0x00200000,
        :FROMSTART,  0x00400000,
        :FROMEND,    0x00800000,
    ]

    define_prefix(:FIND, SearchFlag)
  end
end